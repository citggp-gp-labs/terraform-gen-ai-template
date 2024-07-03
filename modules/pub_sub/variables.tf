variable "project_id" {
  description = "value of project name"
  type = string
}

variable "env" {
  description = "application environment"
  type = string
}

variable "input_topic" {
  description = "Topic that will receive the input"
  type = string
}

variable "output_topic" {
  description = "Topic responsible for receiving the output"
  type = string
}

variable "message_retention_duration" {
  description = "Duration for the retention of the message for pub/sub"
  type = string
}

variable "ack_deadline_seconds" {
  description = "application environment"
  type = string
}
