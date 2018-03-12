# CREATE THE DATABASE
$sqlite backend_info.db


# CREATE TABLES


# USER TABLE
CREATE TABLE Users (
  ID_NUMBER INT NOT NULL, # Personal ID Number, will be unique
  NAME CHAR(50) NOT NULL, # Name of User
  EMAIL CHAR(255) NOT NULL, # User Email
  PASSWORD_HASH CHAR(255) NOT NULL, # Hash of User Password
  USER_STATUS BOOLEAN NOT NULL # Status if the user is online
);

# GROUP TABLE
CREATE TABLE Group (
  GROUP_ID INT NOT NULL, # Group ID Number, will be unique
  GROUP_NAME CHAR(100) NOT NULL, # Group Name, limit of 100 characters
  ADMIN_ID INT NOT NULL, # Personal ID Number of the administrator
  MEMBER_COUNT INT NOT NULL # Number of members in the group, must be positive
);

# POSTS TABLE
CREATE TABLE Posts (
  POSTER_ID INT NOT NULL, # Personal ID of the poster
  POST_ID INT NOT NULL, # ID number of the post (Unique within group)
  GROUP_ID INT NOT NULL, # Group ID Number
  FLAG INT NOT NULL, # How many times the post has been flagged
  POSTED DATETIME NOT NULL, # Date and time when the post was made
  CONTENT CHAR(255) NOT NULL # Content of the Post
);

# COMMENTS TABLE
CREATE TABLE Comments (
  POSTER_ID INT NOT NULL, # Personal ID of the commenter
  POST_ID INT NOT NULL, # ID number of the post which is commented on (Unique within group)
  COMMENT_ID NOT NULL, # Unique ID number of the comment
  GROUP_ID INT NOT NULL, # Group ID Number
  FLAG INT NOT NULL, # How many times the comment has been flagged
  POSTED DATETIME NOT NULL, # Date and time when the comment was made
  CONTENT CHAR(255) NOT NULL # Content of the Comment
);

# TABLE OF GROUPS AND USERS
CREATE TABLE Group_Users (
  ID_NUMBER INT NOT NULL, # Unique User ID
  GROUP_ID INT NOT NULL, # Unique Group ID
  USER_ADMIN BOOLEAN NOT NULL, # If the user is an adminstrator
  USER_MODERATOR BOOLEAN NOT NULL, # If the user is a moderator
  USER_POINTS INT NOT NULL # How many points this user has in this group
);

# TABLE OF PENDING INVITES
CREATE TABLE Invited_Users (
  GROUP_ID INT NOT NULL, # Unique Group ID
  INVITER_ID INT NOT NULL, # ID of user issuing invite
  ACCESS_KEY CHAR(255) NOT NULL # Key to join the group, with entry being removed after key is used
  EMAIL CHAR(255) # Optional Email to send key to
);

# TABLE OF READ POSTS
CREATE TABLE Read_Posts (
  ID_NUMBER INT NOT NULL, # ID number of the user
  GROUP_ID INT NOT NULL, # Group where post is
  POST_ID INT NOT NULL, # Post in question
  READ BOOLEAN NOT NULL # Whether the post has been seen by the user
);

# EXIT SQLITE
quit;
