```mermaid
erDiagram

users ||--o{ courses : ""
users ||--o{ favorites : ""
users ||--o{ comments : ""
courses ||--o{ favorites : ""
courses ||--o{ comments : ""
courses ||--|{ course_railroads : ""
courses ||--o{ course_categories : ""
railroads ||--o{ course_railroads : ""
categories ||--o{ course_categories : ""


users {
  id integer PK
  name string
  email string
  crypted_password string
  salt string
  avatar string
  reset_password_token string
  reset_password_token_expires_at datetime
  reset_password_email_sent_at datetime
  access_count_to_reset_password_page integer
  created_at datetime
	updated_at datetime
}

courses {
  id integer PK
  user_id integer FK
  title string
  description text
  image string
  created_at datetime
	updated_at datetime
}

course_railroads {
  id integer PK
  course_id integer FK
  railroad_id integer FK
  quantity　integer
  created_at datetime
	updated_at datetime
}

railroads {
  id integer PK
  railroad string
  created_at datetime
	updated_at datetime
}

course_categories {
  id integer PK
  course_id integer FK
  category_id integer FK
  created_at datetime
	updated_at datetime
}

categories {
  id integer PK
  category string
  created_at datetime
	updated_at datetime
}

favorites {
  id integer PK
  user_id integer FK
  course_id integer FK
  created_at datetime
	updated_at datetime
}

comments {
  id integer PK
  user_id integer FK
  course_id integer FK
  body text
  created_at datetime
	updated_at datetime
}
```
