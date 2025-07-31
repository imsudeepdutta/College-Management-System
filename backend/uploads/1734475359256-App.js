import jsPDF from "jspdf";
import html2canvas from "html2canvas";
import * as XLSX from "xlsx";
import React, { useState, useEffect } from "react";
import axios from "axios";
import {
  BrowserRouter as Router,
  Route,
  Routes,
  useNavigate,
} from "react-router-dom";
import "../src/App.css";

const WelcomePage = () => {
  const navigate = useNavigate();
  return (
    <div className="main-container-all">
      <nav>
        <div className="left">
          <h2>TimeTable Generator</h2>
        </div>
        <div className="right"></div>
      </nav>
      <div className="main-con">
        <div className="left-main-con">
          <h1>Revolutionizing Schedules, One Class at a Time</h1>
          <p>
            We’re revolutionizing the way you schedule your classes. With our
            automatic timetable generator, you can create, customize, and manage
            your timetable with just a few clicks. Join us in transforming the
            world of academic scheduling, one class at a time.
          </p>
          <button
            className="c-t-g double-border-button"
            onClick={() => navigate("/step1")}
          >
            Click to Generate
          </button>
          <button
              className="c-t-a double-border-button"
              onClick={() => navigate("/attendance")}
            >
              Take Attendance
            </button>
            <button
            className="c-t-a double-border-button"
            onClick={() => navigate("/assign-assignment")}
          >
            Assign Assignment
          </button>
          <button
            className="c-t-a double-border-button"
            onClick={() => navigate("/student")}
          >
            Student Assignment
          </button>
          <button
            className="c-t-a double-border-button"
            onClick={() => navigate("/grade")}
          >
            Grade Assignments
          </button>
        </div>
      </div>
    </div>
  );
};

const AttendancePage = () => {
  const [session, setSession] = useState('');
  const [school, setSchool] = useState('');
  const [department, setDepartment] = useState('');
  const [program, setProgram] = useState('');
  const [semester, setSemester] = useState('');
  const [subject, setSubject] = useState('');
  const [schools, setSchools] = useState([]);
  const [departments, setDepartments] = useState([]);
  const [programs, setPrograms] = useState([]);
  const [semesters, setSemesters] = useState([]);
  const [subjects, setSubjects] = useState([]);
  const [students, setStudents] = useState([]);
  const [attendanceDate, setAttendanceDate] = useState('');
  const [attendanceStatus, setAttendanceStatus] = useState({});

  // Fetch schools
  useEffect(() => {
    axios.get('http://localhost:3001/api/schools')
      .then(response => setSchools(response.data))
      .catch(error => console.error('Error fetching schools:', error));
  }, []);

  // Fetch departments when school is selected
  useEffect(() => {
    if (school) {
      axios.get(`http://localhost:3001/api/departments/${school}`)
        .then(response => setDepartments(response.data))
        .catch(error => console.error('Error fetching departments:', error));
    }
  }, [school]);

  // Fetch programs when department is selected
  useEffect(() => {
    if (department) {
      axios.get(`http://localhost:3001/api/programs/${department}`)
        .then(response => setPrograms(response.data))
        .catch(error => console.error('Error fetching programs:', error));
    }
  }, [department]);

  // Fetch semesters when program is selected
  useEffect(() => {
    if (program) {
      axios.get(`http://localhost:3001/api/semesters/${program}?session=${session}`)
        .then(response => setSemesters(response.data))
        .catch(error => console.error('Error fetching semesters:', error));
    }
  }, [program, session]);

  // Fetch subjects when semester is selected
  useEffect(() => {
    if (semester) {
      axios.get(`http://localhost:3001/api/subjects/${semester}`)
        .then(response => setSubjects(response.data))
        .catch(error => console.error('Error fetching subjects:', error));
    }
  }, [semester]);

  // Fetch students when subject is selected
  useEffect(() => {
    if (program && semester) {
      axios.get(`http://localhost:3001/api/students`, {
        params: { programId: program, semesterId: semester }
      })
        .then(response => {
          setStudents(response.data);
          // Initialize attendance status for each student
          const initialStatus = response.data.reduce((acc, student) => {
            acc[student.id] = 'Present';
            return acc;
          }, {});
          setAttendanceStatus(initialStatus);
        })
        .catch(error => console.error('Error fetching students:', error));
    }
  }, [program, semester]);

  const handleAttendanceSubmit = () => {
    const attendanceRecords = students.map(student => ({
      studentId: student.id,
      status: attendanceStatus[student.id]
    }));

    axios.post('http://localhost:3001/api/attendance', {
      semesterId: semester,
      subjectId: subject,
      attendanceRecords,
      date: attendanceDate
    })
    .then(response => {
      alert('Attendance saved successfully!');
    })
    .catch(error => {
      console.error('Error saving attendance:', error);
      alert('Failed to save attendance');
    });
  };

  return (
    <div className="attendance-container">
      <h1>Take Attendance</h1>
      
      <div className="attendance-form">
        <select 
          value={session} 
          onChange={(e) => setSession(e.target.value)}
        >
          <option value="">Select Session</option>
          <option value="Aug-Dec">Aug-Dec</option>
          <option value="Jan-Jul">Jan-Jul</option>
        </select>

        <select 
          value={school} 
          onChange={(e) => setSchool(e.target.value)}
        >
          <option value="">Select School</option>
          {schools.map(s => (
            <option key={s.id} value={s.id}>{s.name}</option>
          ))}
        </select>

        <select 
          value={department} 
          onChange={(e) => setDepartment(e.target.value)}
        >
          <option value="">Select Department</option>
          {departments.map(d => (
            <option key={d.id} value={d.id}>{d.name}</option>
          ))}
        </select>

        <select 
          value={program} 
          onChange={(e) => setProgram(e.target.value)}
        >
          <option value="">Select Program</option>
          {programs.map(p => (
            <option key={p.id} value={p.id}>{p.name}</option>
          ))}
        </select>

        <select 
          value={semester} 
          onChange={(e) => setSemester(e.target.value)}
        >
          <option value="">Select Semester</option>
          {semesters.map(s => (
            <option key={s.id} value={s.id}>{s.name}</option>
          ))}
        </select>

        <select 
          value={subject} 
          onChange={(e) => setSubject(e.target.value)}
        >
          <option value="">Select Subject</option>
          {subjects.map(s => (
            <option key={s.id} value={s.id}>{s.name}</option>
          ))}
        </select>

        <input 
          type="date" 
          value={attendanceDate}
          onChange={(e) => setAttendanceDate(e.target.value)}
        />

        {students.length > 0 && (
          <div className="students-attendance">
            <h2>Students</h2>
            {students.map(student => (
              <div key={student.id} className="student-attendance-row">
                <span>{student.name} ({student.registration_number})</span>
                <select
                  value={attendanceStatus[student.id]}
                  onChange={(e) => setAttendanceStatus({
                    ...attendanceStatus,
                    [student.id]: e.target.value
                  })}
                >
                  <option value="Present">Present</option>
                  <option value="Absent">Absent</option>
                  <option value="Late">Late</option>
                </select>
              </div>
            ))}
          </div>
        )}

        <button onClick={handleAttendanceSubmit}>
          Save Attendance
        </button>
      </div>
    </div>
  );
};


const Step1 = ({
  session,
  setSession,
  school,
  setSchool,
  department,
  setDepartment,
  program,
  setProgram,
  semester,
  setSemester,
}) => {
  const navigate = useNavigate();
  const [schools, setSchools] = useState([]);
  const [departments, setDepartments] = useState([]);
  const [programs, setPrograms] = useState([]);
  const [semesters, setSemesters] = useState([]);

  // Fetch schools on component load
  useEffect(() => {
    axios
      .get("http://localhost:3001/api/schools")
      .then((response) => {
        setSchools(response.data);
      })
      .catch((error) => {
        console.error("Error fetching schools:", error);
      });
  }, []);

  // Fetch departments when a school is selected
  useEffect(() => {
    if (school) {
      axios
        .get(`http://localhost:3001/api/departments/${school}`)
        .then((response) => {
          setDepartments(response.data);
        })
        .catch((error) => {
          console.error("Error fetching departments:", error);
        });
    }
  }, [school]);

  // Fetch programs when a department is selected
  useEffect(() => {
    if (department) {
      axios
        .get(`http://localhost:3001/api/programs/${department}`)
        .then((response) => {
          setPrograms(response.data);
        })
        .catch((error) => {
          console.error("Error fetching programs:", error);
        });
    }
  }, [department]);

  // Fetch semesters when a program is selected
  useEffect(() => {
    if (program && session) {
      axios
        .get(`http://localhost:3001/api/semesters/${program}`, {
          params: { session },
        })
        .then((response) => {
          setSemesters(response.data);
        })
        .catch((error) => {
          console.error("Error fetching semesters:", error);
        });
    }
  }, [program, session]);

  return (
    <div className="session-main">
      <div className="sec-page-main">
        <div className="select-wrapper">
          <label>Select Session: </label>
          <select
            value={session}
            onChange={(e) => {
              setSession(e.target.value);
              // Reset dependent fields when session changes
              setDepartment("");
              setProgram("");
              setSemester("");
            }}
          >
            <option value="">--Select Session--</option>
            <option value="Aug-Dec">Aug-Dec</option>
            <option value="Jan-Jul">Jan-Jul</option>
          </select>
        </div>

        {session && (
          <div className="select-wrapper">
            <label>Select School: </label>
            <select value={school} onChange={(e) => setSchool(e.target.value)}>
              <option value="">--Select School--</option>
              {schools.map((school) => (
                <option key={school.id} value={school.id}>
                  {school.name}
                </option>
              ))}
            </select>
          </div>
        )}

        {school && (
          <div className="select-wrapper">
            <label>Select Department: </label>
            <select
              value={department}
              onChange={(e) => setDepartment(e.target.value)}
            >
              <option value="">--Select Department--</option>
              {departments.map((dept) => (
                <option key={dept.id} value={dept.id}>
                  {dept.name}
                </option>
              ))}
            </select>
          </div>
        )}

        {department && (
          <div className="select-wrapper">
            <label>Select Program: </label>
            <select
              value={program}
              onChange={(e) => setProgram(e.target.value)}
            >
              <option value="">--Select Program--</option>
              {programs.map((prog) => (
                <option key={prog.id} value={prog.id}>
                  {prog.name}
                </option>
              ))}
            </select>
          </div>
        )}

        {program && (
          <div className="select-wrapper">
            <label>Select Semester: </label>
            <select
              value={semester}
              onChange={(e) => setSemester(e.target.value)}
            >
              <option value="">--Select Semester--</option>
              {semesters.map((sem) => (
                <option key={sem.id} value={sem.id}>
                  {sem.name}
                </option>
              ))}
            </select>
          </div>
        )}

        {semester && (
          <button className="semester-next" onClick={() => navigate("/step2")}>
            Next
          </button>
        )}
      </div>
    </div>
  );
};

const Step2 = ({
  semesterSubjects,
  department,
  program,
  semester,
  subjects,
  handleSubjectSelection,
  teachers,
  setTeachers, // Add this
  assignedTeachers,
  handleTeacherAssignment,
  generateTimetable,
}) => {
  const navigate = useNavigate();
  const [fetchedSubjects, setFetchedSubjects] = useState([]);
  const [newSubject, setNewSubject] = useState("");
  const [newTeacher, setNewTeacher] = useState("");

  // Fetch subjects from the database
  useEffect(() => {
    if (semester) {
      axios
        .get(`http://localhost:3001/api/subjects/${semester}`)
        .then((response) => {
          setFetchedSubjects(response.data);
        })
        .catch((error) => {
          console.error("Error fetching subjects:", error);
        });
    }
  }, [semester]);

  // Add a new subject
  // Add a new subject
  const handleAddSubject = () => {
    if (newSubject.trim() === "") {
      alert("Subject name cannot be empty.");
      return;
    }

    axios
      .post(`http://localhost:3001/api/subjects`, {
        semesterId: semester, // Send the semester ID
        name: newSubject, // Match the database column name
      })
      .then((response) => {
        // Update the local list with the newly added subject
        setFetchedSubjects([...fetchedSubjects, response.data.subject]);
        setNewSubject(""); // Clear the input field
        alert("Subject added successfully.");
      })
      .catch((error) => {
        console.error("Error adding subject:", error);
        alert("Failed to add subject. Please try again.");
      });
  };

  // Delete a subject
  const handleDeleteSubject = (subjectId) => {
    if (window.confirm("Are you sure you want to delete this subject?")) {
      axios
        .delete(`http://localhost:3001/api/subjects/${subjectId}`)
        .then(() => {
          setFetchedSubjects(
            fetchedSubjects.filter((sub) => sub.id !== subjectId)
          );
          alert("Subject deleted successfully.");
        })
        .catch((error) => {
          console.error("Error deleting subject:", error);
          alert("Failed to delete subject. Please try again.");
        });
    }
  };

  const handleGenerateClick = () => {
    if (subjects.length > 15) {
      alert("Please select below 12 total subjects");
      return;
    }

    const labSubjects = subjects.filter((subject) => subject.endsWith("Lab"));
    if (labSubjects.length > 5) {
      alert("Please select below 5 labs.");
      return;
    }

    generateTimetable();
    navigate("/timetable");
  };

  // Add a new teacher
  const handleAddTeacher = () => {
    if (newTeacher.trim() === "") {
      alert("Teacher name cannot be empty.");
      return;
    }

    axios
      .post(`http://localhost:3001/api/teachers`, {
        name: newTeacher,
      })
      .then((response) => {
        // Update the local list with the newly added teacher
        setTeachers([...teachers, response.data.teacher.name]);
        setNewTeacher(""); // Clear the input field
        alert("Teacher added successfully.");
      })
      .catch((error) => {
        console.error("Error adding teacher:", error);
        alert("Failed to add teacher. Please try again.");
      });
  };

  // Delete a teacher
  const handleDeleteTeacher = (teacherName) => {
    if (
      window.confirm(`Are you sure you want to delete teacher ${teacherName}?`)
    ) {
      // Find the teacher's ID first
      axios
        .get("http://localhost:3001/api/teachers")
        .then((response) => {
          const teacherToDelete = response.data.find(
            (t) => t.name === teacherName
          );
          if (teacherToDelete) {
            return axios.delete(
              `http://localhost:3001/api/teachers/${teacherToDelete.id}`
            );
          }
          throw new Error("Teacher not found");
        })
        .then(() => {
          setTeachers(teachers.filter((t) => t !== teacherName));
          alert("Teacher deleted successfully.");
        })
        .catch((error) => {
          console.error("Error deleting teacher:", error);
          alert("Failed to delete teacher. Please try again.");
        });
    }
  };

  return (
    <div className="Subject-sel-co">
      {fetchedSubjects.length > 0 && (
        <div className="Subject-selec">
          <div className="sub-lab">
            <h1>Craft Your Class Schedule</h1>
            <p>
              Select the subjects, classes, and time slots for your students.
              Build a customized timetable that ensures a smooth flow of
              learning throughout the week.
            </p>
          </div>
          <div className="subjects-container">
            {fetchedSubjects.map((subject) => (
              <div key={subject.id} className="subject-list">
                <CustomCheckbox
                  label={subject.name}
                  checked={subjects.includes(subject.name)}
                  onChange={() => handleSubjectSelection(subject.name)}
                />
                <button
                  className="delete-subject-btn"
                  onClick={() => handleDeleteSubject(subject.id)}
                >
                  Delete
                </button>
              </div>
            ))}
          </div>
        </div>
      )}

      <div className="add-subject">
        <input
          type="text"
          placeholder="Enter new subject name"
          value={newSubject}
          onChange={(e) => setNewSubject(e.target.value)}
        />
        <button onClick={handleAddSubject}>Add Subject</button>
      </div>

      {subjects.length > 0 && (
        <div className="assign-tec">
          <label className="assi-tec">Assign Teachers: </label>
          {subjects.map((subject) => (
            <div key={subject} className="select-wrapper">
              <label>{subject}: </label>
              <select
                value={assignedTeachers[subject] || ""}
                onChange={(e) =>
                  handleTeacherAssignment(subject, e.target.value)
                }
              >
                <option value="">--Select Teacher--</option>
                {teachers.map((teacher) => (
                  <option key={teacher} value={teacher}>
                    {teacher}
                  </option>
                ))}
              </select>
            </div>
          ))}
        </div>
      )}

      <div className="teacher-management">
        <h3>Teacher Management</h3>
        <div className="add-teacher">
          <input
            type="text"
            placeholder="Enter new teacher name"
            value={newTeacher}
            onChange={(e) => setNewTeacher(e.target.value)}
          />
          <button onClick={handleAddTeacher}>Add Teacher</button>
        </div>
        <div className="teacher-list">
          <h4>Current Teachers</h4>
          {teachers.map((teacher) => (
            <div key={teacher} className="teacher-item">
              {teacher}
              <button
                className="delete-teacher-btn"
                onClick={() => handleDeleteTeacher(teacher)}
              >
                Delete
              </button>
            </div>
          ))}
        </div>
      </div>

      {subjects.length > 0 && (
        <button className="gene-tt" onClick={handleGenerateClick}>
          Generate Timetable
        </button>
      )}
    </div>
  );
};

const CustomCheckbox = ({ label, checked, onChange }) => {
  return (
    <div
      className={`checkbox-wrapper-16 ${
        checked ? "checkbox-wrapper-active" : ""
      }`}
    >
      <label className="checkbox-wrapper">
        <input
          type="checkbox"
          className="checkbox-input"
          checked={checked}
          onChange={onChange}
        />
        <span className="checkbox-tile">
          <span className="checkbox-label">{label}</span>
        </span>
      </label>
    </div>
  );
};

const days = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
];

const TimetablePage = ({
  generatedTimetable,
  setGeneratedTimetable, // Add this prop
  subjects,
  assignedTeachers,
  downloadPDF,
  downloadPNG,
  downloadExcel,
  resetTimetable,
  session,
  school,
  department,
  program,
  semester,
}) =>  {
  const [isSaving, setIsSaving] = useState(false);
  const [isEditing, setIsEditing] = useState(false);
  const [editableTimetable, setEditableTimetable] = useState([
    ...generatedTimetable,
  ]);
  const [conflicts, setConflicts] = useState([]);

  // Reset editable timetable when generated timetable changes
  useEffect(() => {
    setEditableTimetable([...generatedTimetable]);
  }, [generatedTimetable]);

  const checkForConflicts = async (timetable) => {
    try {
      const response = await axios.post(
        "http://localhost:3001/api/check-conflicts",
        { timetable }
      );
      setConflicts(response.data.conflicts || []);
    } catch (error) {
      console.error("Error checking conflicts:", error);
    }
  };

  const handleFixConflicts = async () => {
    try {
      // First, check for conflicts
      const semesterNumber = semester.replace(/\D/g, "");
      const response = await axios.post(
        "http://localhost:3001/api/resolve-conflicts",
        {
          departmentId: department,
          programId: program,
          semesterNumber,
          conflicts,
        }
      );

      if (
        response.data.resolvedConflicts &&
        response.data.resolvedConflicts.length > 0
      ) {
        // Update the generated timetable with resolved conflicts
        const newTimetable = [...generatedTimetable];

        response.data.resolvedConflicts.forEach((resolvedConflict) => {
          newTimetable.forEach((daySchedule, dayIndex) => {
            daySchedule.forEach((subject, slotIndex) => {
              if (
                subject === resolvedConflict.original &&
                days[dayIndex] === resolvedConflict.day
              ) {
                newTimetable[dayIndex][slotIndex] =
                  resolvedConflict.replacement;
              }
            });
          });
        });

        // Update the timetable and clear conflicts
        setGeneratedTimetable(newTimetable);
        setConflicts([]);

        // Optionally, re-run the conflict check
        await checkForConflicts(newTimetable);

        alert("Conflicts have been resolved!");
      } else {
        alert("No conflicts could be resolved.");
      }
    } catch (error) {
      console.error("Error fixing conflicts:", error);
      alert("Failed to resolve conflicts. Please try again.");
    }
  };

  const saveTimetable = async () => {
    setIsSaving(true);
    const semesterNumber = semester.replace(/\D/g, "");
    try {
      const response = await axios.post(
        "http://localhost:3001/api/save-timetable",
        {
          session,
          schoolId: school,
          departmentId: department,
          programId: program,
          semesterId: semester,
          timetableData: generatedTimetable,
          teacherAssignments: assignedTeachers,
          semesterNumber,
        }
      );

      if (response.data) {
        alert("Timetable saved successfully!");
        setIsEditing(false);
      }
    } catch (error) {
      if (error.response && error.response.data.conflicts) {
        // Store the conflicts for later resolution
        setConflicts(error.response.data.conflicts);

        // Display conflicts to the user
        const conflictDetails = error.response.data.conflicts
          .map(
            (conflict) =>
              `Conflict: ${conflict.day}, ${conflict.timeSlot}, Subject: ${conflict.subject}, Teacher: ${conflict.teacher}`
          )
          .join("\n");

        alert(
          `Timetable conflicts detected:\n${conflictDetails}\nClick "Fix Conflicts" to resolve.`
        );
      } else {
        console.error("Error saving timetable:", error);
        alert("Failed to save timetable. Please try again.");
      }
    }
    setIsSaving(false);
  };

  const handleEditToggle = () => {
    setIsEditing(!isEditing);
  };

  const handleCellChange = (dayIndex, slotIndex, newValue) => {
    const updatedTimetable = [...editableTimetable];
    updatedTimetable[dayIndex][slotIndex] = newValue;
    setEditableTimetable(updatedTimetable);
  };

  return (
    <div className="last-page">
      <div className="last-sec-page">
        <h3>Generated Timetable</h3>
        <div id="timetable-wrapper">
          <div id="timetable">
            <table border="1">
              <thead>
                <tr>
                  <th>Time</th>
                  {[
                    "8:45-9:45",
                    "9:45-10:45",
                    "10:45-11:45",
                    "11:45-12:45",
                    "12:00-1:45",
                    "1:45-2:45",
                    "2:45-3:45",
                  ].map((time, index) => (
                    <th key={index}>{time}</th>
                  ))}
                </tr>
              </thead>
              <tbody>
                {[
                  "Monday",
                  "Tuesday",
                  "Wednesday",
                  "Thursday",
                  "Friday",
                  "Saturday",
                ].map((day, dayIndex) => (
                  <tr key={day}>
                    <td>{day}</td>
                    {(isEditing ? editableTimetable : generatedTimetable)[
                      dayIndex
                    ].map((subject, slotIndex) => (
                      <td key={slotIndex}>
                        {slotIndex === 3 ? (
                          "Lunch Break"
                        ) : isEditing ? (
                          <select
                            value={subject}
                            onChange={(e) =>
                              handleCellChange(
                                dayIndex,
                                slotIndex,
                                e.target.value
                              )
                            }
                          >
                            <option value="">--Select Subject--</option>
                            {subjects.map((sub) => (
                              <option key={sub} value={sub}>
                                {sub}
                              </option>
                            ))}
                          </select>
                        ) : (
                          subject
                        )}
                      </td>
                    ))}
                  </tr>
                ))}
              </tbody>
            </table>
          </div>

          <h3>Subject and Teacher Assignments</h3>
          <ul className="teach-lis" id="subject-teacher-assignments">
            {subjects.map((subject) => (
              <li key={subject}>
                {subject}: {assignedTeachers[subject]}
              </li>
            ))}
          </ul>
        </div>
        <div className="button-container">
          <button className="last-down" onClick={handleEditToggle}>
            {isEditing ? "Stop Editing" : "Edit Timetable"}
          </button>
          <button className="last-down" onClick={downloadPDF}>
            Download as PDF
          </button>
          <button className="last-down" onClick={downloadPNG}>
            Download as PNG
          </button>
          <button className="last-down" onClick={downloadExcel}>
            Download as Excel
          </button>
          <button
            className="last-down"
            onClick={saveTimetable}
            disabled={isSaving}
          >
            {isSaving ? "Saving..." : "Save Timetable"}
          </button>
          {conflicts.length > 0 && (
            <button className="last-down" onClick={handleFixConflicts}>
              Fix Conflicts
            </button>
          )}
        </div>
      </div>
    </div>
  );
};

const AssignAssignmentPage = () => {
  const [session, setSession] = useState('');
  const [school, setSchool] = useState('');
  const [department, setDepartment] = useState('');
  const [program, setProgram] = useState('');
  const [semester, setSemester] = useState('');
  const [subject, setSubject] = useState('');
  const [schools, setSchools] = useState([]);
  const [departments, setDepartments] = useState([]);
  const [programs, setPrograms] = useState([]);
  const [semesters, setSemesters] = useState([]);
  const [subjects, setSubjects] = useState([]);
  const [assignmentTitle, setAssignmentTitle] = useState('');
  const [assignmentDescription, setAssignmentDescription] = useState('');
  const [dueDate, setDueDate] = useState('');
  const [maxMarks, setMaxMarks] = useState('');

  // Fetch schools
  useEffect(() => {
    axios.get('http://localhost:3001/api/schools')
      .then(response => setSchools(response.data))
      .catch(error => console.error('Error fetching schools:', error));
  }, []);

  // Fetch departments when school is selected
  useEffect(() => {
    if (school) {
      axios.get(`http://localhost:3001/api/departments/${school}`)
        .then(response => setDepartments(response.data))
        .catch(error => console.error('Error fetching departments:', error));
    }
  }, [school]);

  // Fetch programs when department is selected
  useEffect(() => {
    if (department) {
      axios.get(`http://localhost:3001/api/programs/${department}`)
        .then(response => setPrograms(response.data))
        .catch(error => console.error('Error fetching programs:', error));
    }
  }, [department]);

  // Fetch semesters when program is selected
  useEffect(() => {
    if (program) {
      axios.get(`http://localhost:3001/api/semesters/${program}?session=${session}`)
        .then(response => setSemesters(response.data))
        .catch(error => console.error('Error fetching semesters:', error));
    }
  }, [program, session]);

  // Fetch subjects when semester is selected
  useEffect(() => {
    if (semester) {
      axios.get(`http://localhost:3001/api/subjects/${semester}`)
        .then(response => setSubjects(response.data))
        .catch(error => console.error('Error fetching subjects:', error));
    }
  }, [semester]);

  const handleSubmitAssignment = () => {
    if (!subject || !assignmentTitle || !dueDate || !maxMarks) {
      alert('Please fill in all required fields');
      return;
    }

    axios.post('http://localhost:3001/api/assignments', {
      semesterId: semester,
      subjectId: subject,
      title: assignmentTitle,
      description: assignmentDescription,
      dueDate: dueDate,
      maxMarks: parseFloat(maxMarks)
    })
    .then(response => {
      alert('Assignment created successfully!');
      // Reset form
      setAssignmentTitle('');
      setAssignmentDescription('');
      setDueDate('');
      setMaxMarks('');
    })
    .catch(error => {
      console.error('Error creating assignment:', error);
      alert('Failed to create assignment');
    });
  };

  return (
    <div className="assign-assignment-container">
      <h1>Assign Assignment</h1>
      
      <div className="assignment-form">
        <select 
          value={session} 
          onChange={(e) => setSession(e.target.value)}
        >
          <option value="">Select Session</option>
          <option value="Aug-Dec">Aug-Dec</option>
          <option value="Jan-Jul">Jan-Jul</option>
        </select>

        <select 
          value={school} 
          onChange={(e) => setSchool(e.target.value)}
        >
          <option value="">Select School</option>
          {schools.map(s => (
            <option key={s.id} value={s.id}>{s.name}</option>
          ))}
        </select>

        <select 
          value={department} 
          onChange={(e) => setDepartment(e.target.value)}
        >
          <option value="">Select Department</option>
          {departments.map(d => (
            <option key={d.id} value={d.id}>{d.name}</option>
          ))}
        </select>

        <select 
          value={program} 
          onChange={(e) => setProgram(e.target.value)}
        >
          <option value="">Select Program</option>
          {programs.map(p => (
            <option key={p.id} value={p.id}>{p.name}</option>
          ))}
        </select>

        <select 
          value={semester} 
          onChange={(e) => setSemester(e.target.value)}
        >
          <option value="">Select Semester</option>
          {semesters.map(s => (
            <option key={s.id} value={s.id}>{s.name}</option>
          ))}
        </select>

        <select 
          value={subject} 
          onChange={(e) => setSubject(e.target.value)}
        >
          <option value="">Select Subject</option>
          {subjects.map(s => (
            <option key={s.id} value={s.id}>{s.name}</option>
          ))}
        </select>

        <input 
          type="text"
          placeholder="Assignment Title"
          value={assignmentTitle}
          onChange={(e) => setAssignmentTitle(e.target.value)}
        />

        <textarea 
          placeholder="Assignment Description"
          value={assignmentDescription}
          onChange={(e) => setAssignmentDescription(e.target.value)}
        />

        <label>Due Date</label>
        <input 
          type="date"
          value={dueDate}
          onChange={(e) => setDueDate(e.target.value)}
        />

        <input 
          type="number"
          placeholder="Max Marks"
          value={maxMarks}
          onChange={(e) => setMaxMarks(e.target.value)}
        />

        <button onClick={handleSubmitAssignment}>
          Create Assignment
        </button>
      </div>
    </div>
  );
};

const StudentAssignmentPage = () => {
  const [session, setSession] = useState('');
  const [school, setSchool] = useState('');
  const [department, setDepartment] = useState('');
  const [program, setProgram] = useState('');
  const [semester, setSemester] = useState('');
  const [subject, setSubject] = useState('');
  const [schools, setSchools] = useState([]); // Add this line
  const [departments, setDepartments] = useState([]); // Add this line
  const [programs, setPrograms] = useState([]); // Add this line
  const [semesters, setSemesters] = useState([]); // Add this line
  const [subjects, setSubjects] = useState([]); // Add this line
  const [studentName, setStudentName] = useState('');
  const [registrationNumber, setRegistrationNumber] = useState('');
  const [assignments, setAssignments] = useState([]);
  const [selectedAssignment, setSelectedAssignment] = useState(null);
  const [assignmentFile, setAssignmentFile] = useState(null);

  // Same fetch logic as previous components for schools, departments, etc.
  // [Reuse the useEffect hooks from AssignAssignmentPage]

    // Fetch schools
    useEffect(() => {
      axios.get('http://localhost:3001/api/schools')
        .then(response => setSchools(response.data))
        .catch(error => console.error('Error fetching schools:', error));
    }, []);
  
    // Fetch departments when school is selected
    useEffect(() => {
      if (school) {
        axios.get(`http://localhost:3001/api/departments/${school}`)
          .then(response => setDepartments(response.data))
          .catch(error => console.error('Error fetching departments:', error));
      }
    }, [school]);
  
    // Fetch programs when department is selected
    useEffect(() => {
      if (department) {
        axios.get(`http://localhost:3001/api/programs/${department}`)
          .then(response => setPrograms(response.data))
          .catch(error => console.error('Error fetching programs:', error));
      }
    }, [department]);
  
    // Fetch semesters when program is selected
    useEffect(() => {
      if (program) {
        axios.get(`http://localhost:3001/api/semesters/${program}?session=${session}`)
          .then(response => setSemesters(response.data))
          .catch(error => console.error('Error fetching semesters:', error));
      }
    }, [program, session]);
  
    // Fetch subjects when semester is selected
    useEffect(() => {
      if (semester) {
        axios.get(`http://localhost:3001/api/subjects/${semester}`)
          .then(response => setSubjects(response.data))
          .catch(error => console.error('Error fetching subjects:', error));
      }
    }, [semester]);

  useEffect(() => {
    if (subject) {
      axios.get(`http://localhost:3001/api/assignments/${subject}`)
        .then(response => setAssignments(response.data))
        .catch(error => console.error('Error fetching assignments:', error));
    }
  }, [subject]);

  const handleFileUpload = (event) => {
    setAssignmentFile(event.target.files[0]);
  };

  const handleSubmitAssignment = () => {
    if (!studentName || !registrationNumber || !selectedAssignment || !assignmentFile) {
      alert('Please fill in all fields and select a file');
      return;
    }

    const formData = new FormData();
    formData.append('assignmentId', selectedAssignment);
    formData.append('studentName', studentName);
    formData.append('registrationNumber', registrationNumber);
    formData.append('assignmentFile', assignmentFile);

    axios.post('http://localhost:3001/api/student-assignments', formData, {
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    })
    .then(response => {
      alert('Assignment submitted successfully!');
      // Reset form
      setSelectedAssignment(null);
      setAssignmentFile(null);
    })
    .catch(error => {
      console.error('Error submitting assignment:', error);
      alert('Failed to submit assignment');
    });
  };

  return (
    <div className="student-assignment-container">
      <h1>Student Assignment Submission</h1>
      
      <div className="student-assignment-form">
        {/* Reuse the select dropdowns from previous components */}
        {/* [Same dropdowns for session, school, department, program, semester, subject] */}

        <select 
          value={session} 
          onChange={(e) => setSession(e.target.value)}
        >
          <option value="">Select Session</option>
          <option value="Aug-Dec">Aug-Dec</option>
          <option value="Jan-Jul">Jan-Jul</option>
        </select>

        <select 
          value={school} 
          onChange={(e) => setSchool(e.target.value)}
        >
          <option value="">Select School</option>
          {schools.map(s => (
            <option key={s.id} value={s.id}>{s.name}</option>
          ))}
        </select>

        <select 
          value={department} 
          onChange={(e) => setDepartment(e.target.value)}
        >
          <option value="">Select Department</option>
          {departments.map(d => (
            <option key={d.id} value={d.id}>{d.name}</option>
          ))}
        </select>

        <select 
          value={program} 
          onChange={(e) => setProgram(e.target.value)}
        >
          <option value="">Select Program</option>
          {programs.map(p => (
            <option key={p.id} value={p.id}>{p.name}</option>
          ))}
        </select>

        <select 
          value={semester} 
          onChange={(e) => setSemester(e.target.value)}
        >
          <option value="">Select Semester</option>
          {semesters.map(s => (
            <option key={s.id} value={s.id}>{s.name}</option>
          ))}
        </select>

        <select 
          value={subject} 
          onChange={(e) => setSubject(e.target.value)}
        >
          <option value="">Select Subject</option>
          {subjects.map(s => (
            <option key={s.id} value={s.id}>{s.name}</option>
          ))}
        </select>


        <input 
          type="text"
          placeholder="Student Name"
          value={studentName}
          onChange={(e) => setStudentName(e.target.value)}
        />

        <input 
          type="text"
          placeholder="Registration Number"
          value={registrationNumber}
          onChange={(e) => setRegistrationNumber(e.target.value)}
        />

        <select 
          value={selectedAssignment || ''}
          onChange={(e) => setSelectedAssignment(e.target.value)}
        >
          <option value="">Select Assignment</option>
          {assignments.map(assignment => (
            <option key={assignment.id} value={assignment.id}>
              {assignment.title} (Due: {assignment.due_date})
            </option>
          ))}
        </select>

        <input 
          type="file"
          onChange={handleFileUpload}
        />

        <button onClick={handleSubmitAssignment}>
          Submit Assignment
        </button>
      </div>
    </div>
  );
};

const GradingPage = () => {
  const [session, setSession] = useState('');
  const [school, setSchool] = useState('');
  const [department, setDepartment] = useState('');
  const [program, setProgram] = useState('');
  const [semester, setSemester] = useState('');
  const [subject, setSubject] = useState('');
  const [schools, setSchools] = useState([]); // Add this line
  const [departments, setDepartments] = useState([]); // Add this line
  const [programs, setPrograms] = useState([]); // Add this line
  const [semesters, setSemesters] = useState([]); // Add this line
  const [subjects, setSubjects] = useState([]); // Add this line
  const [studentAssignments, setStudentAssignments] = useState([]);
  const [grades, setGrades] = useState({});

  // Reuse the same fetch logic for dropdowns
  // [Same useEffect hooks as previous components]
    // Fetch schools
    useEffect(() => {
      axios.get('http://localhost:3001/api/schools')
        .then(response => setSchools(response.data))
        .catch(error => console.error('Error fetching schools:', error));
    }, []);
  
    // Fetch departments when school is selected
    useEffect(() => {
      if (school) {
        axios.get(`http://localhost:3001/api/departments/${school}`)
          .then(response => setDepartments(response.data))
          .catch(error => console.error('Error fetching departments:', error));
      }
    }, [school]);
  
    // Fetch programs when department is selected
    useEffect(() => {
      if (department) {
        axios.get(`http://localhost:3001/api/programs/${department}`)
          .then(response => setPrograms(response.data))
          .catch(error => console.error('Error fetching programs:', error));
      }
    }, [department]);
  
    // Fetch semesters when program is selected
    useEffect(() => {
      if (program) {
        axios.get(`http://localhost:3001/api/semesters/${program}?session=${session}`)
          .then(response => setSemesters(response.data))
          .catch(error => console.error('Error fetching semesters:', error));
      }
    }, [program, session]);
  
    // Fetch subjects when semester is selected
    useEffect(() => {
      if (semester) {
        axios.get(`http://localhost:3001/api/subjects/${semester}`)
          .then(response => setSubjects(response.data))
          .catch(error => console.error('Error fetching subjects:', error));
      }
    }, [semester]);

  useEffect(() => {
    if (subject) {
      axios.get(`http://localhost:3001/api/grading/${subject}`)
        .then(response => setStudentAssignments(response.data))
        .catch(error => console.error('Error fetching student assignments:', error));
    }
  }, [subject]);

  const handleGradeChange = (assignmentId, grade) => {
    setGrades({
      ...grades,
      [assignmentId]: grade
    });
  };

  const handleSubmitGrades = () => {
    const gradeSubmissions = Object.entries(grades).map(([assignmentId, grade]) => ({
      assignmentId: parseInt(assignmentId),
      grade: parseFloat(grade)
    }));

    axios.post('http://localhost:3001/api/submit-grades', { grades: gradeSubmissions })
      .then(response => {
        alert('Grades submitted successfully!');
        // Optionally refresh the assignments list
      })
      .catch(error => {
        console.error('Error submitting grades:', error);
        alert('Failed to submit grades');
      });
  };

  return (
    <div className="grading-container">
      <h1>Assignment Grading</h1>
      
      <div className="grading-form">
        {/* Reuse the select dropdowns from previous components */}
        {/* [Same dropdowns for session, school, department, program, semester, subject] */}
        <select 
          value={session} 
          onChange={(e) => setSession(e.target.value)}
        >
          <option value="">Select Session</option>
          <option value="Aug-Dec">Aug-Dec</option>
          <option value="Jan-Jul">Jan-Jul</option>
        </select>

        <select 
          value={school} 
          onChange={(e) => setSchool(e.target.value)}
        >
          <option value="">Select School</option>
          {schools.map(s => (
            <option key={s.id} value={s.id}>{s.name}</option>
          ))}
        </select>

        <select 
          value={department} 
          onChange={(e) => setDepartment(e.target.value)}
        >
          <option value="">Select Department</option>
          {departments.map(d => (
            <option key={d.id} value={d.id}>{d.name}</option>
          ))}
        </select>

        <select 
          value={program} 
          onChange={(e) => setProgram(e.target.value)}
        >
          <option value="">Select Program</option>
          {programs.map(p => (
            <option key={p.id} value={p.id}>{p.name}</option>
          ))}
        </select>

        <select 
          value={semester} 
          onChange={(e) => setSemester(e.target.value)}
        >
          <option value="">Select Semester</option>
          {semesters.map(s => (
            <option key={s.id} value={s.id}>{s.name}</option>
          ))}
        </select>

        <select 
          value={subject} 
          onChange={(e) => setSubject(e.target.value)}
        >
          <option value="">Select Subject</option>
          {subjects.map(s => (
            <option key={s.id} value={s.id}>{s.name}</option>
          ))}
        </select>

        {studentAssignments.map(assignment => (
          <div key={assignment.id} className="assignment-grading-row">
            <span>{assignment.student_name}</span>
            <span>{assignment.assignment_title}</span>
            <a 
              href={`http://localhost:3001/uploads/${assignment.file_path}`} 
              target="_blank" 
              rel="noopener noreferrer"
            >
              View Submission
            </a>
            <input 
              type="number"
              placeholder="Grade"
              max={assignment.max_marks}
              value={grades[assignment.id] || ''}
              onChange={(e) => handleGradeChange(assignment.id, e.target.value)}
            />
          </div>
        ))}

        <button onClick={handleSubmitGrades}>
          Submit Grades
        </button>
      </div>
    </div>
  );
};

const App = () => {
  const [teachers, setTeachers] = useState([]);
  const [session, setSession] = useState("");
  const [school, setSchool] = useState("");
  const [department, setDepartment] = useState("");
  const [program, setProgram] = useState("");
  const [semester, setSemester] = useState("");
  const [subjects, setSubjects] = useState([]);
  const [assignedTeachers, setAssignedTeachers] = useState({});
  const [generatedTimetable, setGeneratedTimetable] = useState([]);

  useEffect(() => {
    axios
      .get("http://localhost:3001/api/teachers")
      .then((response) => {
        // Assuming the response contains an array of teacher objects with a 'name' property
        const teacherNames = response.data.map((teacher) => teacher.name);
        setTeachers(teacherNames);
      })
      .catch((error) => {
        console.error("Error fetching teachers:", error);
        // Optionally, set a default or empty array if fetch fails
        setTeachers([]);
      });
  }, []);

  const handleSubjectSelection = (subject) => {
    if (subjects.includes(subject)) {
      setSubjects(subjects.filter((s) => s !== subject));
    } else {
      setSubjects([...subjects, subject]);
    }
  };

  const handleTeacherAssignment = (subject, teacher) => {
    setAssignedTeachers({ ...assignedTeachers, [subject]: teacher });
  };

  const generateTimetable = () => {
    const days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
    ];
    const slotsPerDay = 7;
    const timetable = Array.from({ length: days.length }, () =>
      Array(slotsPerDay).fill("")
    );

    const labSubjects = subjects.filter((subject) => subject.endsWith("Lab"));
    const regularSubjects = subjects.filter(
      (subject) => !subject.endsWith("Lab")
    );

    const isLabSlot = (day, slot) => timetable[day][slot].endsWith("Lab");

    const canPlaceLab = (day, slot) => {
      if (slot >= slotsPerDay - 1 || slot === 2) return false;
      return !isLabSlot(day, slot + 1);
    };

    const placeLab = (day, slot, lab) => {
      timetable[day][slot] = lab;
      timetable[day][slot + 1] = lab;
    };

    const canPlaceRegularSubject = (day, slot, subject) => {
      if (timetable[day][slot] !== "") return false; // Slot is already taken
      if (slot > 0 && timetable[day][slot - 1] === subject) return false; // Consecutive horizontally
      if (day > 0 && timetable[day - 1][slot] === subject) return false; // Consecutive vertically
      return true;
    };

    const placeRegularSubject = (day, slot, subject) => {
      timetable[day][slot] = subject;
    };

    // Step 1: Place labs
    let placedLabs = new Set();
    for (let day = 0; day < days.length; day++) {
      for (let slot = 0; slot < slotsPerDay - 1; slot++) {
        if (canPlaceLab(day, slot)) {
          const availableLabs = labSubjects.filter(
            (lab) => !placedLabs.has(lab)
          );
          if (availableLabs.length > 0) {
            const labToPlace =
              availableLabs[Math.floor(Math.random() * availableLabs.length)];
            placeLab(day, slot, labToPlace);
            placedLabs.add(labToPlace);
            break; // Move to the next day
          }
        }
      }
    }

    // Step 2: Place regular subjects
    const totalRegularSlots =
      days.length * slotsPerDay - placedLabs.size * 2 - days.length; // Exclude lunch and placed labs
    const subjectSlots = Math.floor(totalRegularSlots / regularSubjects.length);

    let subjectCounts = regularSubjects.reduce((acc, subject) => {
      acc[subject] = 0;
      return acc;
    }, {});

    for (let day = 0; day < days.length; day++) {
      for (let slot = 0; slot < slotsPerDay; slot++) {
        if (timetable[day][slot] === "" && slot !== 3) {
          // Skip lunch break
          const availableSubjects = regularSubjects.filter(
            (subject) => subjectCounts[subject] < subjectSlots
          );
          if (availableSubjects.length > 0) {
            const subjectToPlace =
              availableSubjects[
                Math.floor(Math.random() * availableSubjects.length)
              ];
            if (canPlaceRegularSubject(day, slot, subjectToPlace)) {
              placeRegularSubject(day, slot, subjectToPlace);
              subjectCounts[subjectToPlace]++;
            }
          }
        }
      }
    }

    // Step 3: Fill any remaining slots randomly
    for (let day = 0; day < days.length; day++) {
      for (let slot = 0; slot < slotsPerDay; slot++) {
        if (timetable[day][slot] === "" && slot !== 3) {
          // Skip lunch break
          const subjectToPlace =
            regularSubjects[Math.floor(Math.random() * regularSubjects.length)];
          timetable[day][slot] = subjectToPlace;
        }
      }
    }

    setGeneratedTimetable(timetable);
  };

  const downloadPDF = () => {
    const input = document.getElementById("timetable-wrapper");
    html2canvas(input).then((canvas) => {
      const imgData = canvas.toDataURL("image/png");
      const pdf = new jsPDF();
      pdf.addImage(imgData, "PNG", 10, 10);
      pdf.save("timetable.pdf");
    });
  };

  const downloadPNG = () => {
    const timetableElement = document.getElementById("timetable-wrapper");
    html2canvas(timetableElement).then((canvas) => {
      const img = canvas.toDataURL("image/png");
      const link = document.createElement("a");
      link.href = img;
      link.download = "timetable.png";
      link.click();
    });
  };

  const resetTimetable = () => {
    setSubjects([]);
    setAssignedTeachers({});
    setGeneratedTimetable([]);
  };

  const downloadExcel = () => {
    const ws = XLSX.utils.aoa_to_sheet([]);
    const wb = XLSX.utils.book_new();
    const headers = [
      "Time",
      "8:45-9:45",
      "9:45-10:45",
      "10:45-11:45",
      "11:45-12:45",
      "12:00-1:45",
      "1:45-2:45",
      "2:45-3:45",
    ];
    XLSX.utils.sheet_add_aoa(ws, [headers], { origin: "A1" });

    const days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
    ];
    days.forEach((day, index) => {
      let row = [day, ...generatedTimetable[index]];
      row[4] = "Lunch"; // Set "Lunch" in the appropriate column
      XLSX.utils.sheet_add_aoa(ws, [row], { origin: `A${index + 2}` });
    });

    XLSX.utils.book_append_sheet(wb, ws, "Timetable");
    XLSX.writeFile(wb, "Timetable.xlsx");
  };

  return (
    <Router>
      <Routes>
        <Route path="/" element={<WelcomePage />} />
        <Route
          path="/step1"
          element={
            <Step1
              session={session}
              setSession={setSession}
              school={school}
              setSchool={setSchool}
              department={department}
              setDepartment={setDepartment}
              program={program}
              setProgram={setProgram}
              semester={semester}
              setSemester={setSemester}
            />
          }
        />
        <Route
          path="/step2"
          element={
            <Step2
              department={department}
              program={program}
              semester={semester}
              subjects={subjects}
              handleSubjectSelection={handleSubjectSelection}
              teachers={teachers}
              setTeachers={setTeachers} // Make sure this is included
              assignedTeachers={assignedTeachers}
              handleTeacherAssignment={handleTeacherAssignment}
              generateTimetable={generateTimetable}
            />
          }
        />
        <Route
  path="/timetable"
  element={
    <TimetablePage
      generatedTimetable={generatedTimetable}
      setGeneratedTimetable={setGeneratedTimetable} // Add this
      subjects={subjects}
      assignedTeachers={assignedTeachers}
      downloadPDF={downloadPDF}
      downloadPNG={downloadPNG}
      downloadExcel={downloadExcel}
      resetTimetable={resetTimetable}
      session={session}
      school={school}
      department={department}
      program={program}
      semester={semester}
    />
  }
/>
<Route 
  path="/attendance" 
  element={<AttendancePage />} 
/>
<Route 
          path="/assign-assignment" 
          element={<AssignAssignmentPage />} 
        />
        <Route 
          path="/student" 
          element={<StudentAssignmentPage />} 
        />
        <Route 
          path="/grade" 
          element={<GradingPage />} 
        />
      </Routes>
    </Router>
  );
};

export default App;
