using System.Net;
using System.Net.Sockets;
using System.Runtime.Serialization.Formatters.Binary;
using System.Text;

namespace SweeterServer
{
    public partial class Form1 : Form
    {

        Socket serverSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        List<Socket> clientSockets = new List<Socket>();
        List<string> activeUsers = new List<string>();
        IDictionary<int, string[]> sweets = new Dictionary<int, string[]>();
        List<string> followersList = new List<string>();
        List<string> blockedList = new List<string>();


        bool terminating = false;
        bool listening = false;
        public Form1()
        {
            Control.CheckForIllegalCrossThreadCalls = false;
            this.FormClosing += new FormClosingEventHandler(Form1_FormClosing);
            InitializeComponent();

            string[] txt = System.IO.File.ReadAllLines("C:/Users/gorkemguzeler/source/repos/Network Project/sweets.txt");
            
            foreach (var item in txt)
            {
                string id = item.Substring(0, item.IndexOf('!'));
                int id_x = Int16.Parse(id);

                string username = item.Substring(item.IndexOf('!') + 1, item.IndexOf('%') - item.IndexOf("!")-1);
                string a = item.Substring(item.IndexOf("%") + 1 , item.IndexOf("$") - item.IndexOf("%")- 1);
                string sweet = item.Substring(item.IndexOf('$') + 1);
                string[] sweetinfo = { username, a, sweet };

                sweets.Add(new KeyValuePair<int, string[]>(id_x, sweetinfo));

                //sweets.Add(new KeyValuePair<int, string[]>(sweets.Count + 1, sweetinfo));

            }

            string[] follow = System.IO.File.ReadAllLines("C:/Users/gorkemguzeler/source/repos/Network Project/followers.txt");
            foreach (var line in follow)
            {
                followersList.Add(line);
            }

            string[] block = System.IO.File.ReadAllLines("C:/Users/gorkemguzeler/source/repos/Network Project/blocks.txt");
            foreach (var line in block)
            {
                blockedList.Add(line);
            }
        }


        private void btnListen_Click(object sender, EventArgs e)
        {
            int serverPort;

            if (Int32.TryParse(txtPort.Text, out serverPort))
            {
                IPEndPoint endPoint = new IPEndPoint(IPAddress.Any, serverPort);
                serverSocket.Bind(endPoint);
                serverSocket.Listen(3);

                listening = true;
                btnListen.Enabled = false;

                Thread acceptThread = new Thread(Accept);
                acceptThread.Start();

                txtLogs.AppendText("Started listening on port: " + serverPort + "\n");

            }
            else
            {
                txtLogs.AppendText("Please check port number \n");
            }
        }

        private void Accept()
        {
            while (listening)
            {
                try
                {
                    Socket newClient = serverSocket.Accept();
                    clientSockets.Add(newClient);

                    Thread receiveThread = new Thread(() => Receive(newClient)); // updated
                    receiveThread.Start();
                }
                catch
                {
                    if (terminating)
                    {
                        listening = false;
                    }
                    else
                    {
                        txtLogs.AppendText("The socket stopped working.\n");
                    }
                }
            }
        }

        private void Receive(Socket thisClient) // updated
        {
            bool connected = true;

            while (connected && !terminating)
            {
                try
                {
                    Byte[] buffer = new Byte[64];
                    thisClient.Receive(buffer);

                    string incomingMessage = Encoding.Default.GetString(buffer).TrimEnd('\0');
                    char status = incomingMessage[0];
                    incomingMessage = incomingMessage.Substring(1);

                    //string[] activelines = File.ReadAllLines("D:/activeusers.txt");
                    string[] lines = File.ReadAllLines("C:/Users/gorkemguzeler/source/repos/Network Project/users-db.txt");
                    
                    if (status == '1') //Connect
                    {
                        bool isCorrectUsername = false;

                        foreach (string line in lines)
                        {
                            //string l1 = Convert.ToString(line);
                            if (incomingMessage == line)
                            {
                                bool isuniq = true;
                                foreach (string elem in activeUsers)
                                {
                                    if (elem == incomingMessage)
                                    {
                                        isuniq = false;
                                    }
                                }
                                if (isuniq == true)
                                {
                                    isCorrectUsername = true;
                                }
                            }
                        }

                        foreach (string item in txtActive.Lines)
                        {
                            if (incomingMessage == item)
                            {
                                isCorrectUsername = false;
                            }
                        }

                        if (!isCorrectUsername)
                        {
                            txtLogs.AppendText("\nUser is not registered or already exist. \n");

                            string msg = "^";
                            Byte[] sendclient = Encoding.Default.GetBytes(msg);
                            thisClient.Send(sendclient);

                            thisClient.Close();
                            clientSockets.Remove(thisClient);
                            connected = false;
                        }
                        else
                        {

                            txtLogs.AppendText("\n" + incomingMessage + " has connected \n"); ;

                            activeUsers.Add(incomingMessage);
                            txtActive.Text = "";

                            foreach (string item in activeUsers)
                            {
                                txtActive.AppendText(item + "\n");

                            }
                        }
                    }
                    else if (status == '0') //disconnect
                    {

                        foreach (string line in txtActive.Lines)
                        {
                            if (incomingMessage == line)
                            {
                                activeUsers.Remove(incomingMessage);
                                txtActive.Text = "";

                                foreach (string item in activeUsers)
                                {
                                    txtActive.AppendText(item + "\n");
                                }
                            }
                        }

                        txtLogs.AppendText("\n" + incomingMessage + " has disconnected \n");
                        thisClient.Close();

                        //txtLogs.AppendText(clientSockets.Count + "  sonra count");
                        clientSockets.Remove(thisClient);
                        //txtLogs.AppendText("\n zaa "+ clientSockets.Count +"  sonra count");
                        connected = false;

                    }
                    else if (status == '2')//write sweet
                    {

                        string username = incomingMessage.Substring(0, incomingMessage.IndexOf('$'));
                        string sweet = incomingMessage.Substring(incomingMessage.IndexOf('$') + 1);
                        DateTime localDate = DateTime.Now;
                        string a = localDate.ToString();

                        string[] sweetinfo = { username, a, sweet };

                        //sweets.Add(new KeyValuePair<int, string[]>(sweets.Count + 1, sweetinfo));


                        string last = File.ReadLines("C:/Users/gorkemguzeler/source/repos/Network Project/sweets.txt").Last();
                        string id = last.Substring(0, last.IndexOf('!'));
                        int id_x = Int16.Parse(id) +1;

                        sweets.Add(new KeyValuePair<int, string[]>(id_x , sweetinfo));

                        string text =id_x.ToString() + "!" + username + "%" + a + "$" + sweet;

                        txtLogs.AppendText("\n [" + a + "] " + username + ": " + sweet);


                        string[] txt = System.IO.File.ReadAllLines("C:/Users/gorkemguzeler/source/repos/Network Project/sweets.txt");
                        Array.Resize(ref txt, txt.Length + 1);
                        txt[txt.Length - 1] = text;

                        File.WriteAllLinesAsync("C:/Users/gorkemguzeler/source/repos/Network Project/sweets.txt", txt);

                    }
                    else if (status == '3')//get sweets
                    {
                        string username = incomingMessage;
                        

                        string msg = "\nGet sweets:\n";

                        foreach (KeyValuePair<int, string[]> entry in sweets.OrderBy(x => x.Key))
                        {
                            if (entry.Value[0] != username)
                            {
                                string curr_user = entry.Value[0];
                                bool blocked = false;
                                List<string> blockedUsers = new List<string>();
                                foreach (string line in blockedList)
                                {
                                    if (curr_user == line.Substring(0, line.IndexOf('$')) && line.IndexOf('$') != line.Length - 1)
                                    {
                                        string tempp = "";

                                        for (int i = line.IndexOf('$') + 1; i < line.Length - 1; i++)
                                        {


                                            if (line[i] == '$' && i != line.Length - 2)
                                            {
                                                blockedUsers.Add(tempp);
                                                tempp = "";
                                                i = i + 1;
                                            }

                                            if (i == line.Length - 2)
                                            {
                                                tempp += line[i];
                                                blockedUsers.Add(tempp);
                                            }

                                            tempp += line[i];
                                        }

                                    }
                                }

                                foreach (string user in blockedUsers)
                                {
                                    if (username == user)
                                    {
                                        blocked = true;
                                    }
                                }
                                if (!blocked)
                                {
                                    msg += "\n" + entry.Key + " " + entry.Value[0] + " " + entry.Value[1] + " " + entry.Value[2];
                                }
                                
                            }
                        }


                        Byte[] sendclient = Encoding.Default.GetBytes(msg);
                        thisClient.Send(sendclient);

                    }


                    else if (status == '=')//get my sweets
                    {
                        string username = incomingMessage;

                        string msg = "\nGet my sweets:\n";

                        foreach (KeyValuePair<int, string[]> entry in sweets.OrderBy(x => x.Key))
                        {
                            if (entry.Value[0] == username)
                            {

                                msg += "\n" + entry.Key + " " + entry.Value[0] + " " + entry.Value[1] + " " + entry.Value[2];
                            }
                        }


                        Byte[] sendclient = Encoding.Default.GetBytes(msg);
                        thisClient.Send(sendclient);

                    }





                    else if (status == '4')//get users
                    {
                        string[] linex = File.ReadAllLines("C:/Users/gorkemguzeler/source/repos/Network Project/users-db.txt");

                        string usernames = "";

                        foreach (string line in linex)
                        {
                            usernames += "\n" + line;

                        }

                        Byte[] sendclient = Encoding.Default.GetBytes(usernames);
                        thisClient.Send(sendclient);
                    }
                    else if (status == '5') // Follow
                    {
                        string[] usersdb = File.ReadAllLines("C:/Users/gorkemguzeler/source/repos/Network Project/users-db.txt");

                        bool isCorrectUsername = false;
                        string follower = incomingMessage.Substring(0, incomingMessage.IndexOf('$'));
                        string following = incomingMessage.Substring(incomingMessage.IndexOf('$') + 1);


                        foreach (string line in usersdb)
                        {
                            //string l1 = Convert.ToString(line);
                            if (following == line)
                            {
                                isCorrectUsername = true;
                            }
                        }

                        if (isCorrectUsername)
                        {

                            bool alreadyfollowing = false;

                            bool alreadyblocked = false;
                            List<string> blockedUsers = new List<string>();
                            foreach (string line in blockedList)
                            {
                                if (following == line.Substring(0, line.IndexOf('$')) && line.IndexOf('$') != line.Length - 1)
                                {
                                    string tempp = "";

                                    for (int i = line.IndexOf('$') + 1; i < line.Length - 1; i++)
                                    {


                                        if (line[i] == '$' && i != line.Length - 2)
                                        {
                                            blockedUsers.Add(tempp);
                                            tempp = "";
                                            i = i + 1;
                                        }

                                        if (i == line.Length - 2)
                                        {
                                            tempp += line[i];
                                            blockedUsers.Add(tempp);
                                        }

                                        tempp += line[i];
                                    }

                                }
                            }

                            foreach (string user in blockedUsers)
                            {
                                if (follower == user)
                                {
                                    alreadyblocked = true;
                                }
                            }

                            List<string> followingUsers = new List<string>();
                            foreach (string line in followersList)
                            {
                                if (follower == line.Substring(0, line.IndexOf('$')) && line.IndexOf('$') != line.Length - 1)
                                {
                                    string tempp = "";

                                    for (int i = line.IndexOf('$') + 1; i < line.Length - 1; i++)
                                    {


                                        if (line[i] == '$' && i != line.Length - 2)
                                        {
                                            followingUsers.Add(tempp);
                                            tempp = "";
                                            i = i + 1;
                                        }

                                        if (i == line.Length - 2)
                                        {
                                            tempp += line[i];
                                            followingUsers.Add(tempp);
                                        }

                                        tempp += line[i];
                                    }

                                }
                            }
                           
                                foreach (string user in followingUsers)
                                {
                                    if ( following == user)
                                    {
                                      alreadyfollowing = true;
                                    }
                                }



                            if (alreadyblocked)
                            {
                                string msg = "n";
                                Byte[] sendclient = Encoding.Default.GetBytes(msg);
                                thisClient.Send(sendclient);

                                txtLogs.AppendText("\nUser blocked can't be followed \n");
                            }


                            else if (alreadyfollowing)
                            {
                                string msg = "8";
                                Byte[] sendclient = Encoding.Default.GetBytes(msg);
                                thisClient.Send(sendclient);

                                txtLogs.AppendText("\nUser Already Following \n");
                            }
                            else
                            {
                                int indexm = -1;
                                foreach (string line in followersList)
                                {
                                    if (follower == line.Substring(0, line.IndexOf('$')))
                                    {
                                        indexm = followersList.IndexOf(line);
                                    }
                                }
                                if (indexm != -1 && follower != following)
                                {
                                    followersList[indexm] += following + "$";
                                    txtLogs.AppendText(follower + " has started following " + following + ". \n");

                                    string a_msg = follower + " has started following " + following + ".\n";
                                    string msg = "7" + a_msg;
                                    Byte[] sendclient = Encoding.Default.GetBytes(msg);
                                    thisClient.Send(sendclient);
                                }
                                else
                                {
                                    string msg = "9";
                                    Byte[] sendclient = Encoding.Default.GetBytes(msg);
                                    thisClient.Send(sendclient);

                                    //txtLogs.AppendText(follower + ", you cannot follow yourself!"); //THIS ERROR SHOULD BE GIVEN TO CLIENT!
                                }
                            }
                            File.WriteAllLinesAsync("C:/Users/gorkemguzeler/source/repos/Network Project/followers.txt", followersList);
                        }
                        else
                        {
                            string msg = "?";
                            Byte[] sendclient = Encoding.Default.GetBytes(msg);
                            thisClient.Send(sendclient);

                            txtLogs.AppendText("\nWrong Username Following \n");
                        }
                    }
                    else if (status == '6')  //GET SWEETS OF USERS YOU FOLLOW
                    {
                        string username = incomingMessage;
                        List<string> followingUsers = new List<string>();
                        foreach (string line in followersList)
                        {
                            if (username == line.Substring(0, line.IndexOf('$')) && line.IndexOf('$') != line.Length - 1)
                            {
                                string tempp = "";

                                for (int i = line.IndexOf('$') + 1; i < line.Length - 1; i++)
                                {


                                    if (line[i] == '$' && i != line.Length - 2)
                                    {
                                        followingUsers.Add(tempp);
                                        tempp = "";
                                        i = i + 1;
                                    }

                                    if (i == line.Length - 2)
                                    {
                                        tempp += line[i];
                                        followingUsers.Add(tempp);
                                    }

                                    tempp += line[i];
                                }

                            }
                        }
                        string msg = "\nTweets of users you are following:\n";
                        foreach (KeyValuePair<int, string[]> entry in sweets.OrderBy(x => x.Key))
                        {
                            foreach (string user in followingUsers)
                            {
                                if (entry.Value[0] == user)
                                {
                                    msg += "\n" + entry.Key + " " + entry.Value[0] + " " + entry.Value[1] + " " + entry.Value[2] + "\n";
                                }
                            }
                        }
                        Byte[] sendclient = Encoding.Default.GetBytes(msg);
                        thisClient.Send(sendclient);

                    }

                    else if (status == '7')  //GET FOLLOWERS
                    {

                        string username = incomingMessage;
                        List<string> followers = new List<string>();
                        foreach (string line in followersList)
                        {
                            if (username != line.Substring(0, line.IndexOf('$')) && line.IndexOf('$') != line.Length - 1)
                            {
                                string tempp = "";

                                for (int i = line.IndexOf('$') + 1; i < line.Length - 1; i++)
                                {


                                    if (line[i] == '$' && i != line.Length - 2)
                                    {
                                        
                                        if(tempp == username)
                                        {
                                            followers.Add(line.Substring(0, line.IndexOf('$')));
                                        }

                                        tempp = "";
                                        i = i + 1;
                                    }


                                    if (i == line.Length - 2)
                                    {
                                        tempp += line[i];


                                        if (tempp == username)
                                        {
                                            followers.Add(line.Substring(0, line.IndexOf('$')));
                                        }

                                    }

                                    tempp += line[i];
                                }

                            }
                        }

                        string msg = "\nYour followers:\n";

                        foreach (string user in followers)
                        {

                            msg += user + "\n";

                        }

                        Byte[] sendclient = Encoding.Default.GetBytes(msg);
                        thisClient.Send(sendclient);



                    }

                    else if (status == '8')  //GET FOLLOWINGS
                    {
                        string username = incomingMessage;
                        List<string> followingUsers = new List<string>();
                        foreach (string line in followersList)
                        {
                            if (username == line.Substring(0, line.IndexOf('$')) && line.IndexOf('$') != line.Length - 1)
                            {
                                string tempp = "";

                                for (int i = line.IndexOf('$') + 1; i < line.Length - 1; i++)
                                {


                                    if (line[i] == '$' && i != line.Length - 2)
                                    {
                                        followingUsers.Add(tempp);
                                        tempp = "";
                                        i = i + 1;
                                    }

                                    if (i == line.Length - 2)
                                    {
                                        tempp += line[i];
                                        followingUsers.Add(tempp);
                                    }

                                    tempp += line[i];
                                }

                            }
                        }

                        string msg = "\nYou are following:\n";
                    
                        foreach (string user in followingUsers)
                        {
                                   
                         msg +=  user + "\n";
                            
                        }
                        
                        Byte[] sendclient = Encoding.Default.GetBytes(msg);
                        thisClient.Send(sendclient);

                    }

                    else if (status == '9')  //DELETE SWEET
                    {

                        string username = incomingMessage.Substring(0, incomingMessage.IndexOf('$'));
                        string sweet_id = incomingMessage.Substring(incomingMessage.IndexOf('$') + 1);

                        if(!sweets.ContainsKey(Int16.Parse(sweet_id))) {

                            string msg = "This tweet is out of list!\n" ; 

                            Byte[] sendclient = Encoding.Default.GetBytes(msg);
                            thisClient.Send(sendclient);

                        }

                        else
                        {
                            if (username == sweets[Int16.Parse(sweet_id)][0] )
                            {

                                sweets.Remove(Int16.Parse(sweet_id)); //Delete from dict

                                //delete from DB
                                var tempFile = Path.GetTempFileName();
                                var linesToKeep = File.ReadLines("C:/Users/gorkemguzeler/source/repos/Network Project/sweets.txt").Where(l => l.Substring(0, l.IndexOf('!')) != sweet_id);

                                File.WriteAllLines(tempFile, linesToKeep);

                                File.Delete("C:/Users/gorkemguzeler/source/repos/Network Project/sweets.txt");
                                File.Move(tempFile, "C:/Users/gorkemguzeler/source/repos/Network Project/sweets.txt");

                                string msg = "\nYou deleted your sweet:\n" + sweet_id;

                                Byte[] sendclient = Encoding.Default.GetBytes(msg);
                                thisClient.Send(sendclient);

                            }
                            else
                            {
                                string msg = "This sweet does not belong to you!\n";

                                Byte[] sendclient = Encoding.Default.GetBytes(msg);
                                thisClient.Send(sendclient);
                            }

                        }

                    }

                    else if (status == 'b') // BLOCK
                    {
                        string username = incomingMessage.Substring(0, incomingMessage.IndexOf('$'));
                        string user_to_block = incomingMessage.Substring(incomingMessage.IndexOf('$') + 1);


                        string[] usersdb = File.ReadAllLines("C:/Users/gorkemguzeler/source/repos/Network Project/users-db.txt");

                        bool isCorrectUsername = false;
                        
                        foreach (string line in usersdb)
                        {
                            //string l1 = Convert.ToString(line);
                            if (user_to_block == line)
                            {
                                isCorrectUsername = true;
                            }
                        }

                        if (isCorrectUsername)
                        {

                            bool alreadyblocked = false;

                            List<string> blockedUsers = new List<string>();
                            foreach (string line in blockedList)
                            {
                                if (username == line.Substring(0, line.IndexOf('$')) && line.IndexOf('$') != line.Length - 1)
                                {
                                    string tempp = "";

                                    for (int i = line.IndexOf('$') + 1; i < line.Length - 1; i++)
                                    {


                                        if (line[i] == '$' && i != line.Length - 2)
                                        {
                                            blockedUsers.Add(tempp);
                                            tempp = "";
                                            i = i + 1;
                                        }

                                        if (i == line.Length - 2)
                                        {
                                            tempp += line[i];
                                            blockedUsers.Add(tempp);
                                        }

                                        tempp += line[i];
                                    }

                                }
                            }

                            foreach (string user in blockedUsers)
                            {
                                if (user_to_block == user)
                                {
                                    alreadyblocked = true;
                                }
                            }

                            if (alreadyblocked)
                            {
                                string msg = "b";
                                Byte[] sendclient = Encoding.Default.GetBytes(msg);
                                thisClient.Send(sendclient);

                                txtLogs.AppendText("\nUser Already Blocked \n");
                            }

                            else
                            {
                                int indexm = -1;
                                foreach (string line in blockedList)
                                {
                                    if (username == line.Substring(0, line.IndexOf('$')))
                                    {
                                        indexm = blockedList.IndexOf(line);
                                    }
                                }
                                if (indexm != -1 && user_to_block != username)
                                {
                                    bool alreadyfollowing = false;
                                    List<string> followingUsers = new List<string>();
                                    int curr_idx = 0;
                                    int idx = 0;
                                    bool change = false;
                                    foreach (string line in followersList)
                                    {
                                        if (user_to_block == line.Substring(0, line.IndexOf('$')) && line.IndexOf('$') != line.Length - 1)
                                        {
                                            curr_idx = idx;
                                            string tempp = "";
                                            for (int i = line.IndexOf('$') + 1; i < line.Length - 1; i++)
                                            {

                                                if (line[i] == '$' && i != line.Length - 2)
                                                {
                                                    if(tempp != username)
                                                    {
                                                        followingUsers.Add(tempp);
                                                    }
                                                    else
                                                    {
                                                        change = true;
                                                    }
                                                    tempp = "";
                                                    i = i + 1;
                                                }

                                                if (i == line.Length - 2)
                                                {
                                                    tempp += line[i];
                                                    if (tempp != username)
                                                    {
                                                        followingUsers.Add(tempp);
                                                    }
                                                    else
                                                    {
                                                        change = true;
                                                    }
                                                }
                                                tempp += line[i];
                                            }
                                        }
                                        idx++;
                                    }

                                    

                                    if (change)
                                    {
                                        string new_line = user_to_block + "$";
                                        foreach( string str in followingUsers)
                                        {
                                            new_line += str + "$";
                                        }
                                        followersList[curr_idx] = new_line;
                                        File.WriteAllLinesAsync("C:/Users/gorkemguzeler/source/repos/Network Project/followers.txt", followersList);
                                    }
                                    blockedList[indexm] += user_to_block + "$";
                                    txtLogs.AppendText(user_to_block + " has been blocked by" + username + ". \n");

                                    string a_msg = user_to_block + " has been blocked by " + username + ".\n";
                                    string msg = "7" + a_msg;
                                    Byte[] sendclient = Encoding.Default.GetBytes(msg);
                                    thisClient.Send(sendclient);
                                }
                                else
                                {
                                    string msg = "d";
                                    Byte[] sendclient = Encoding.Default.GetBytes(msg);
                                    thisClient.Send(sendclient);

                                    //txtLogs.AppendText(follower + ", you cannot block yourself!"); //blcok'ng yourself case
                                }
                            }
                            File.WriteAllLinesAsync("C:/Users/gorkemguzeler/source/repos/Network Project/blocks.txt", blockedList);
                        }
                        else
                        {
                            string msg = "?";
                            Byte[] sendclient = Encoding.Default.GetBytes(msg);
                            thisClient.Send(sendclient);

                            txtLogs.AppendText("\nWrong Username \n");
                        }

                    }

                }
                catch
                {

                    Byte[] buffer = new Byte[64];
                    thisClient.Receive(buffer);

                    string incomingMessage = Encoding.Default.GetString(buffer).TrimEnd('\0');
                    char status = incomingMessage[0];
                    incomingMessage = incomingMessage.Substring(1);


                    //if (!terminating)
                    //{
                    //    txtLogs.AppendText("\nA client has disconnected\n");
                    //}


                    foreach (string line in txtActive.Lines)
                    {
                        if (incomingMessage == line)
                        {
                            activeUsers.Remove(incomingMessage);
                            txtActive.Text = "";

                            foreach (string item in activeUsers)
                            {
                                txtActive.AppendText(item + "\n");
                            }
                        }
                    }

                    txtLogs.AppendText("\n" + incomingMessage + "client has disconnected \n");
                    thisClient.Close();

                    clientSockets.Remove(thisClient);
                    connected = false;

                }
            }
        }

        private void Form1_FormClosing(object sender, System.ComponentModel.CancelEventArgs e)
        {

            //Notify client to disconnect
            foreach (Socket i in clientSockets.ToList())
            {
                string msg = "_";
                Byte[] sendclient = Encoding.Default.GetBytes(msg);
                i.Send(sendclient);

                clientSockets.Remove(i);
            }



            listening = false;
            terminating = true;

            Environment.Exit(0);
        }
    }
}