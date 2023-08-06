function classroomManagementSystem()

    students = struct('Name', {}, 'Section', {}, 'Role', {}, 'Subject', {});

    while true
        disp('-------------------------------------');
        disp('Classroom Management System');
        disp('-------------------------------------');
        disp('1. Add a new student');
        disp('2. Display all students');
        disp('3. Search for a student');
        disp('4. Update student details');
        disp('5. Delete a student');
        disp('6. Exit');
        
        choice = input('Enter your choice (1-6): ');

        switch choice
            case 1
                students = addStudent(students);
            case 2
                displayStudents(students);
            case 3
                searchStudent(students);
            case 4
                students = updateStudent(students);
            case 5
                students = deleteStudent(students);
            case 6
                disp('Exiting the Classroom Management System.');
                break;
            otherwise
                disp('Invalid choice. Please try again.');
        end
    end
end

function students = addStudent(students)
    name = input('Enter student name: ', 's');
    section = input('Enter student section: ', 's');
    role = input('Enter student role: ', 's');
    subject = input('Enter student subject: ', 's');
    
    newStudent = struct('Name', name, 'Section', section, 'Role', role, 'Subject', subject);
    students = [students, newStudent];
    
    disp('Student added successfully!');
end

function displayStudents(students)
    if isempty(students)
        disp('No students in the list.');
    else
        disp('-------------------------------------');
        disp('Student List');
        disp('-------------------------------------');
        for i = 1:length(students)
            disp(['Name: ', students(i).Name]);
            disp(['Section: ', students(i).Section]);
            disp(['Role: ', students(i).Role]);
            disp(['Subject: ', students(i).Subject]);
            disp('-------------------------------------');
        end
    end
end

function searchStudent(students)
    if isempty(students)
        disp('No students in the list.');
    else
        name = input('Enter the name of the student to search: ', 's');
        found = false;
        
        for i = 1:length(students)
            if strcmpi(students(i).Name, name)
                disp('-------------------------------------');
                disp('Student found!');
                disp(['Name: ', students(i).Name]);
                disp(['Section: ', students(i).Section]);
                disp(['Role: ', students(i).Role]);
                disp(['Subject: ', students(i).Subject]);
                disp('-------------------------------------');
                found = true;
                break;
            end
        end
        
        if ~found
            disp('Student not found in the list.');
        end
    end
end

function students = updateStudent(students)
    if isempty(students)
        disp('No students in the list.');
    else
        name = input('Enter the name of the student to update: ', 's');
        found = false;
        
        for i = 1:length(students)
            if strcmpi(students(i).Name, name)
                disp('-------------------------------------');
                disp('Enter the updated details:');
                students(i).Name = input('Name: ', 's');
                students(i).Section = input('Section: ', 's');
                students(i).Role = input('Role: ', 's');
                students(i).Subject = input('Subject: ', 's');
                disp('Student details updated successfully!');
                disp('-------------------------------------');
                found = true;
                break;
            end
        end
        
        if ~found
            disp('Student not found in the list.');
        end
    end
end

function students = deleteStudent(students)
    if isempty(students)
        disp('No students in the list.');
    else
        name = input('Enter the name of the student to delete: ', 's');
        found = false;
        
        for i = 1:length(students)
            if strcmpi(students(i).Name, name)
                disp('-------------------------------------');
                disp(['Deleting student: ', students(i).Name]);
                students(i) = [];
                disp('Student deleted successfully!');
                disp('-------------------------------------');
                found = true;
                break;
            end
        end
        
        if ~found
            disp('Student not found in the list.');
        end
    end
end

