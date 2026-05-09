CREATE TABLE Blog(
    BlogID INT PRIMARY KEY IDENTITY(1,1),

    Title NVARCHAR(255) ,

    Description NVARCHAR(MAX),  

    ImageUrl NVARCHAR(max),    
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME NULL,

    IsPublished BIT DEFAULT 1,
    IsDeleted BIT DEFAULT 0
);

CREATE TABLE course (
    id INT PRIMARY KEY IDENTITY(1,1),
    course_name VARCHAR(200),
    title Varchar(100),
    short_description VARCHAR(500),
    full_description VARCHAR(MAX),
    course_image VARCHAR(max),
    updated_date DATE,
    created_date DATE
);

select * from course
truncate table course

CREATE TABLE testimonial(
    id INT PRIMARY KEY IDENTITY(1,1),
    student_name VARCHAR(100),
    feedback VARCHAR(max)
);

CREATE TABLE faq (
    id INT PRIMARY KEY IDENTITY(1,1),
    question VARCHAR(500),
    answer VARCHAR(MAX)
);

-- Insert FAQ Data

