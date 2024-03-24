using System.Diagnostics;
using System.Net.Sockets;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;

namespace Sweeter
{
    public partial class Form1 : Form
    {

        bool terminating = false;
        bool connected = false;
        Socket clientSocket;

        public Form1()
        {
            Control.CheckForIllegalCrossThreadCalls = false;
            InitializeComponent();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            string IP = txtIP.Text;

            int portNum;
            if (Int32.TryParse(txtPort.Text, out portNum))
            {
                try
                {
                    clientSocket.Connect(IP, portNum);
                    btnConnect.Enabled = false;
                    btnDisconnect.Enabled = true;
                    btnFollowers.Enabled = true;
                    btnFollowing.Enabled = true;
                    txtDelete.Enabled = true;
                    txtBlock.Enabled = true;
                    blockButton.Enabled = true;

                    txtUsername.Enabled = false;

                    btnSend.Enabled = true;
                    btnGetSweet.Enabled = true;
                    txtSweet.Enabled = true;
                    txtIP.Enabled = false;
                    txtPort.Enabled = false;

                    btnAddUser.Enabled = true;
                    btnGetUsers.Enabled = true;
                    button1.Enabled = true;
                    txtUserbox.Enabled = true;

                    btnDelete.Enabled = true;
                    btnFollowers.Enabled = true;
                    btnFollowing.Enabled = true;
                    txtDelete.Enabled = true;
                    btn_my_sweets.Enabled = true;   

                    connected = true;

                    txtLog.AppendText("Connected to the server!\n");

                    string userNametoServer = "1" + txtUsername.Text;
                    Byte[] buffer = Encoding.Default.GetBytes(userNametoServer);
                    clientSocket.Send(buffer);

                    //txtLog.AppendText("Yolladi");

                    Thread receiveThread = new Thread(Receive);
                    receiveThread.Start();

                }
                catch
                {
                    txtLog.AppendText("Could not connect to the server!\n");
                }
            }
            else
            {
                txtLog.AppendText("Check the port\n");
            }
        }

        private void Receive()
        {
            while (connected)
            {
                try
                {
                    Byte[] buffer = new Byte[1024];
                    clientSocket.Receive(buffer);

                    string incomingMessage = Encoding.Default.GetString(buffer);
                    if(incomingMessage[0] != '0') 
                    {
                        if (incomingMessage[0] == '9')
                        {
                            txtLog.AppendText("\nCan not folllow yourself!\n");
                        }

                        else if (incomingMessage[0] == '?')
                        {
                            txtLog.AppendText("\nWrong username!\n");
                        }


                        else if (incomingMessage[0] == '8')
                        {
                            txtLog.AppendText("\nUser Already Following \n");
                        }

                        else if (incomingMessage[0] == '7')
                        {
                            txtLog.AppendText("\n");
                            txtLog.AppendText(incomingMessage.Substring(1, incomingMessage.IndexOf("\n")));
                        }

                        else if (incomingMessage[0] == 'b')
                        {
                            txtLog.AppendText("\nUser Already Blocked \n");
                        }
                        else if (incomingMessage[0] == 'n')
                        {
                            txtLog.AppendText("\nUser blocked you, can't be followed \n");
                        }


                        else if (incomingMessage[0] == 'd')
                        {
                            txtLog.AppendText("\n You cannot block yourself \n");
                        }


                        else if (incomingMessage[0] == '^')
                        {
                            txtLog.AppendText("\nUser is not registered or already exist!\n");
                            btnConnect.Enabled = true;
                            txtSweet.Enabled = false;
                            btnSend.Enabled = false;

                            txtUsername.Enabled = true;
                            txtIP.Enabled = true;
                            txtPort.Enabled = true;
                            clientSocket.Close();
                            connected = false;
                            btnGetSweet.Enabled = false;
                            btnDisconnect.Enabled = false;

                            btnAddUser.Enabled = false;
                            btnGetUsers.Enabled = false;
                            button1.Enabled = false;
                            txtUserbox.Enabled = false;
                            txtBlock.Enabled = false;
                            blockButton.Enabled = false;

                            btnDelete.Enabled = false;
                            btnFollowers.Enabled = false;
                            btnFollowing.Enabled = false;
                            txtDelete.Enabled = false;
                            btn_my_sweets.Enabled = false;



                        }

                        else if (incomingMessage[0] == '_')
                        {

                            txtLog.AppendText("The server has disconnected\n");
                            btnConnect.Enabled = true;
                            txtSweet.Enabled = false;
                            btnSend.Enabled = false;

                            txtUsername.Enabled = true;
                            txtIP.Enabled = true;
                            txtPort.Enabled = true;
                            btnAddUser.Enabled = false;
                            btnGetUsers.Enabled = false;
                            button1.Enabled = false;
                            txtUserbox.Enabled = false;
                            txtBlock.Enabled = false;
                            btnDisconnect.Enabled = false;
                            blockButton.Enabled = false;
                            btnGetSweet.Enabled = false;

                            btnDelete.Enabled = false;
                            btnFollowers.Enabled = false;
                            btnFollowing.Enabled = false;
                            txtDelete.Enabled = false;
                            btn_my_sweets.Enabled = false;

                            clientSocket.Close();
                            connected = false;
                        }




                        else
                        {
                            txtLog.AppendText(incomingMessage);
                        }

                    }

                    //else if(incomingMessage[0] != '2')
                    //{
                        
                    //    txtLog.AppendText("\nCan not folllow user!\n");
        
                    //}

                    else 
                    {
                        txtLog.AppendText("Wrong or duplicate user.\n");
                        txtLog.AppendText("The server has disconnected\n");
                        btnConnect.Enabled = true;
                        txtSweet.Enabled = false;
                        btnSend.Enabled = false;

                        txtUsername.Enabled = true;
                        txtIP.Enabled = true;
                        txtPort.Enabled = true;
                        clientSocket.Close();
                        connected = false;

                        btnAddUser.Enabled = false;
                        btnGetUsers.Enabled = false;
                        button1.Enabled = false;
                        txtUserbox.Enabled = false;
                        blockButton.Enabled = false;

                        btnDelete.Enabled = false;
                        btnFollowers.Enabled = false;
                        btnFollowing.Enabled = false;
                        txtDelete.Enabled = false;
                        btn_my_sweets.Enabled = false;

                    }


                }
                catch
                {
                    if (!terminating)
                    {
                        txtLog.AppendText("The server has disconnected\n");
                        btnConnect.Enabled = true;
                        txtSweet.Enabled = false;
                        btnSend.Enabled = false;

                        txtUsername.Enabled = true;
                        txtIP.Enabled = true;
                        txtPort.Enabled = true;
                        btnAddUser.Enabled = false;
                        btnGetUsers.Enabled = false;
                        button1.Enabled = false;
                        txtUserbox.Enabled = false;
                        btnDisconnect.Enabled = false;
                        txtBlock.Enabled = false;
                        blockButton.Enabled = false;
                        btnGetSweet.Enabled = false;

                        btnDelete.Enabled = false;
                        btnFollowers.Enabled = false;
                        btnFollowing.Enabled = false;
                        txtDelete.Enabled = false;
                        btn_my_sweets.Enabled = false;


                    }
                    clientSocket.Close();
                    connected = false;
                }

            }
        }

        private void btnDisconnect_Click(object sender, EventArgs e)
        {
            connected = false;
            terminating = true;

            //clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            string IP = txtIP.Text;

            int portNum;
            if (Int32.TryParse(txtPort.Text, out portNum))
            {
                try
                {
                    //clientSocket.Connect(IP, portNum);
                    btnConnect.Enabled = true;
                    btnDisconnect.Enabled = false;

                    txtUsername.Enabled = true;

                    btnSend.Enabled = false;
                    btnGetSweet.Enabled = false;
                    txtSweet.Enabled = false;
                    txtIP.Enabled = true;
                    txtPort.Enabled = true;

                    btnAddUser.Enabled = false;
                    btnGetUsers.Enabled = false;
                    button1.Enabled = false;
                    txtUserbox.Enabled = false;
                    txtBlock.Enabled = false;
                    blockButton.Enabled = false;

                    btnDelete.Enabled = false;
                    btnFollowers.Enabled = false;
                    btnFollowing.Enabled = false;
                    txtDelete.Enabled = false;
                    btn_my_sweets.Enabled = false;



                    connected = false;

                    txtLog.AppendText("\nDisconnected from the server!\n");

                    string userNametoServer = "0" + txtUsername.Text;
                    Byte[] buffer = Encoding.Default.GetBytes(userNametoServer);
                    clientSocket.Send(buffer);

       

                }
                catch
                {
                    txtLog.AppendText("Could not connect to the server!\n");
                }
            }
            else
            {
                txtLog.AppendText("Check the port\n");
            }


        }

        private void btnSend_Click(object sender, EventArgs e) //SEND SWEET
        {

            //clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            string IP = txtIP.Text;

            // siradaki 2 satir gereksiz
            int portNum;
            if (Int32.TryParse(txtPort.Text, out portNum))
            {
                try
                {
                   

                    string userNametoServer = "2" + txtUsername.Text + "$" + txtSweet.Text;
                    Byte[] buffer = Encoding.Default.GetBytes(userNametoServer);
                    clientSocket.Send(buffer);

                }
                catch
                {
                    txtLog.AppendText("Could not connect to the server!\n");
                }
            }
            else
            {
                txtLog.AppendText("Check the port\n");
            }

        }

        private void btnGetSweet_Click(object sender, EventArgs e) //GET ALL SWEETS
        {

            //clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            string IP = txtIP.Text;

            int portNum;
            if (Int32.TryParse(txtPort.Text, out portNum))
            {
                try
                {
                    //clientSocket.Connect(IP, portNum);
                    //connected = true;

                    string userNametoServer = "3" + txtUsername.Text;
                    Byte[] buffer = Encoding.Default.GetBytes(userNametoServer);
                    clientSocket.Send(buffer);


                }
                catch
                {
                    txtLog.AppendText("Could not connect to the server!\n");
                }
            }
            else
            {
                txtLog.AppendText("Check the port\n");
            }
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (connected)
            {
                try
                {
                    string userNametoServer = "0" + txtUsername.Text;
                    Byte[] buffer = Encoding.Default.GetBytes(userNametoServer);
                    clientSocket.Send(buffer);
                }
                catch (Exception)
                {

                }
            }
            connected = false;
            terminating = true;
            Environment.Exit(0);
        }

        private void btnGetUsers_Click(object sender, EventArgs e) //GET ALL USERS FROM DB
        {
            string IP = txtIP.Text;

            int portNum;
            if (Int32.TryParse(txtPort.Text, out portNum))
            {
                try
                {
               
                    string statuscode = "4";

                    Byte[] buffer = Encoding.Default.GetBytes(statuscode);
                    clientSocket.Send(buffer);

                }
                catch
                {
                    txtLog.AppendText("Could not connect to the server!\n");
                }
            }
            else
            {
                txtLog.AppendText("Check the port\n");
            }
        }

        private void btnAddUser_Click(object sender, EventArgs e) //FOLLOW
        {

            string IP = txtIP.Text;

            int portNum;
            if (Int32.TryParse(txtPort.Text, out portNum))
            {
                try
                {
                    //clientSocket.Connect(IP, portNum);
                    //connected = true;
                    string statuscode = "5" + txtUsername.Text + "$"+ txtUserbox.Text;
                    Byte[] buffer = Encoding.Default.GetBytes(statuscode);
                    clientSocket.Send(buffer);
                       
                }
                catch
                {
                    txtLog.AppendText("Could not connect to the server!\n");
                }
            }
            else
            {
                txtLog.AppendText("Check the port\n");
            }
        }

        private void button1_Click(object sender, EventArgs e) //GET SWEETS OF USERS YOU FOLLOW
        {

            string IP = txtIP.Text;

            int portNum;
            if (Int32.TryParse(txtPort.Text, out portNum))
            {
                try
                {
                    //clientSocket.Connect(IP, portNum);
                    //connected = true;
                    string statuscode = "6" + txtUsername.Text;
                    Byte[] buffer = Encoding.Default.GetBytes(statuscode);
                    clientSocket.Send(buffer);

                }
                catch
                {
                    txtLog.AppendText("Could not connect to the server!\n");
                }
            }
            else
            {
                txtLog.AppendText("Check the port\n");
            }

        }

        private void btnFollowers_Click(object sender, EventArgs e)
        {


            string IP = txtIP.Text;

            int portNum;
            if (Int32.TryParse(txtPort.Text, out portNum))
            {
                try
                {
                    //clientSocket.Connect(IP, portNum);
                    //connected = true;
                    string statuscode = "7" + txtUsername.Text;
                    Byte[] buffer = Encoding.Default.GetBytes(statuscode);
                    clientSocket.Send(buffer);

                }
                catch
                {
                    txtLog.AppendText("Could not connect to the server!\n");
                }
            }
            else
            {
                txtLog.AppendText("Check the port\n");
            }


        }

        private void btnFollowing_Click(object sender, EventArgs e)
        {

            string IP = txtIP.Text;

            int portNum;
            if (Int32.TryParse(txtPort.Text, out portNum))
            {
                try
                {
                    //clientSocket.Connect(IP, portNum);
                    //connected = true;
                    string statuscode = "8" + txtUsername.Text;
                    Byte[] buffer = Encoding.Default.GetBytes(statuscode);
                    clientSocket.Send(buffer);

                }
                catch
                {
                    txtLog.AppendText("Could not connect to the server!\n");
                }
            }
            else
            {
                txtLog.AppendText("Check the port\n");
            }

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {


            string IP = txtIP.Text;

            int portNum;
            if (Int32.TryParse(txtPort.Text, out portNum))
            {
                try
                {
                    //clientSocket.Connect(IP, portNum);
                    //connefcted = true;
                    if (txtDelete.Text=="") {
                        txtLog.AppendText("you should enter a value!\n");

                    }
                    else
                    {
                        string statuscode = "9" + txtUsername.Text + "$" + txtDelete.Text;
                        Byte[] buffer = Encoding.Default.GetBytes(statuscode);
                        clientSocket.Send(buffer);

                    }
               

                }
                catch
                {
                    txtLog.AppendText("Could not connect to the server!\n");
                }
            }
            else
            {
                txtLog.AppendText("Check the port\n");
            }

        }


        private void blockButton_Click(object sender, EventArgs e)
        {
            string IP = txtIP.Text;

            int portNum;
            if (Int32.TryParse(txtPort.Text, out portNum))
            {
                try
                {
                    //clientSocket.Connect(IP, portNum);
                    //connefcted = true;
                    if (txtBlock.Text == "")
                    {
                        txtLog.AppendText("you should enter a value!\n");

                    }
                    else
                    {
                        string statuscode = "b" + txtUsername.Text + "$" + txtBlock.Text;
                        Byte[] buffer = Encoding.Default.GetBytes(statuscode);
                        clientSocket.Send(buffer);

                    }

                }
                catch
                {
                    txtLog.AppendText("Could not connect to the server!\n");
                }
            }
            else
            {
                txtLog.AppendText("Check the port\n");
            }
        }

        private void btn_my_sweets_Click(object sender, EventArgs e)
        {


            //clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            string IP = txtIP.Text;

            int portNum;
            if (Int32.TryParse(txtPort.Text, out portNum))
            {
                try
                {
                    //clientSocket.Connect(IP, portNum);
                    //connected = true;

                    string userNametoServer = "=" + txtUsername.Text;
                    Byte[] buffer = Encoding.Default.GetBytes(userNametoServer);
                    clientSocket.Send(buffer);


                }
                catch
                {
                    txtLog.AppendText("Could not connect to the server!\n");
                }
            }
            else
            {
                txtLog.AppendText("Check the port\n");
            }


        }
    }
}