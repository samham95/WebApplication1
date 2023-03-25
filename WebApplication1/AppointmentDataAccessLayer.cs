﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System;
using System.Net.Mail;
using MySql.Data.MySqlClient;

public class AppointmentDataAccessLayer
{
    private string connectionString;

    public AppointmentDataAccessLayer(string connectionString)
    {
        this.connectionString = connectionString;
    }

    public void DeleteAppointments()
    {
        using (MySqlConnection connection = new MySqlConnection(connectionString))
        {
            connection.Open();
            string query = "UPDATE appointment SET archive = true WHERE DATEDIFF(appointmentDate, CURDATE()) <= 1 AND PATIENT_CONFIRM = false";
            string query2 = "SELECT patients.email FROM patients, appointment WHERE appointment.patientID=patients.patientID AND DATEDIFF(appointmentDate, CURDATE()) <= 1 AND (PATIENT_CONFIRM = false OR Approval = false)";
            MySqlCommand command2 = new MySqlCommand(query2, connection);
           
            MySqlDataReader reader = command2.ExecuteReader();
            string email;
            while (reader.Read()) {
                email = reader["email"].ToString();

                // Email to notify of appointment cancellation
                MailMessage mail = new MailMessage();
                mail.To.Add(email);
                mail.Subject = "Your Appointment has been Cancelled";
                mail.Body = "We are sorry to say your appointment has been cancelled because you did not confirm at least one day prior to the scheduled date. Please try to schedule your appointment again. We hope to see you soon!";
                SmtpClient smtp = new SmtpClient();
                smtp.Send(mail);
            }
            reader.Close();
            MySqlCommand command = new MySqlCommand(query, connection);
            command.ExecuteNonQuery();
            connection.Close();
        }
        
    }
}