# Destroy existing projects
Project.destroy_all

puts "🏠 Let the Homey job application shenanigans begin..."

# Seed initial projects
Project.create(
  name: "Resume Polishing",
  description: "Making my accomplishments sound impressive.",
  status: "completed"
)

Project.create(
  name: "Interview Prep Marathon",
  description: "Practicing answers to 'What's your greatest weakness?' that don't include 'perfectionism' or 'working too hard'.",
  status: "on_hold"
)

Project.create(
  name: "Portfolio Website Crisis",
  description: "Frantically updating my portfolio.",
  status: "completed"

)

Project.create(
  name: "Stalking Homey Employees",
  description: "Professionally researching the team on LinkedIn while trying not to accidentally like a post from 3 years ago.",
  status: "cancelled"
)

Project.create(
  name: "Panic Coding",
  description: "Last-minute project to prove I actually know how to use Rails.",
  status: "in_progress"
)

puts "🤞 Created #{Project.count} hopefully-impressive-enough projects. Please hire me!"
