namespace Sweeter
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtIP = new System.Windows.Forms.TextBox();
            this.txtLog = new System.Windows.Forms.RichTextBox();
            this.txtPort = new System.Windows.Forms.TextBox();
            this.txtUsername = new System.Windows.Forms.TextBox();
            this.txtSweet = new System.Windows.Forms.TextBox();
            this.btnGetSweet = new System.Windows.Forms.Button();
            this.btnSend = new System.Windows.Forms.Button();
            this.btnConnect = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.btnDisconnect = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.btnGetUsers = new System.Windows.Forms.Button();
            this.btnAddUser = new System.Windows.Forms.Button();
            this.txtUserbox = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.btnFollowing = new System.Windows.Forms.Button();
            this.btnFollowers = new System.Windows.Forms.Button();
            this.txtDelete = new System.Windows.Forms.TextBox();
            this.btnDelete = new System.Windows.Forms.Button();
            this.txtBlock = new System.Windows.Forms.TextBox();
            this.blockButton = new System.Windows.Forms.Button();
            this.btn_my_sweets = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // txtIP
            // 
            this.txtIP.Location = new System.Drawing.Point(130, 45);
            this.txtIP.Name = "txtIP";
            this.txtIP.Size = new System.Drawing.Size(178, 27);
            this.txtIP.TabIndex = 1;
            // 
            // txtLog
            // 
            this.txtLog.Location = new System.Drawing.Point(330, 29);
            this.txtLog.Name = "txtLog";
            this.txtLog.ReadOnly = true;
            this.txtLog.Size = new System.Drawing.Size(437, 593);
            this.txtLog.TabIndex = 2;
            this.txtLog.Text = "";
            // 
            // txtPort
            // 
            this.txtPort.Location = new System.Drawing.Point(130, 84);
            this.txtPort.Name = "txtPort";
            this.txtPort.Size = new System.Drawing.Size(178, 27);
            this.txtPort.TabIndex = 3;
            // 
            // txtUsername
            // 
            this.txtUsername.Location = new System.Drawing.Point(130, 117);
            this.txtUsername.Name = "txtUsername";
            this.txtUsername.Size = new System.Drawing.Size(178, 27);
            this.txtUsername.TabIndex = 4;
            // 
            // txtSweet
            // 
            this.txtSweet.AllowDrop = true;
            this.txtSweet.Enabled = false;
            this.txtSweet.Location = new System.Drawing.Point(35, 235);
            this.txtSweet.Name = "txtSweet";
            this.txtSweet.Size = new System.Drawing.Size(273, 27);
            this.txtSweet.TabIndex = 5;
            // 
            // btnGetSweet
            // 
            this.btnGetSweet.Enabled = false;
            this.btnGetSweet.Location = new System.Drawing.Point(35, 268);
            this.btnGetSweet.Name = "btnGetSweet";
            this.btnGetSweet.Size = new System.Drawing.Size(124, 40);
            this.btnGetSweet.TabIndex = 6;
            this.btnGetSweet.Text = "Get Sweets";
            this.btnGetSweet.UseVisualStyleBackColor = true;
            this.btnGetSweet.Click += new System.EventHandler(this.btnGetSweet_Click);
            // 
            // btnSend
            // 
            this.btnSend.Enabled = false;
            this.btnSend.Location = new System.Drawing.Point(184, 268);
            this.btnSend.Name = "btnSend";
            this.btnSend.Size = new System.Drawing.Size(124, 40);
            this.btnSend.TabIndex = 7;
            this.btnSend.Text = "Send Sweets";
            this.btnSend.UseVisualStyleBackColor = true;
            this.btnSend.Click += new System.EventHandler(this.btnSend_Click);
            // 
            // btnConnect
            // 
            this.btnConnect.Location = new System.Drawing.Point(35, 162);
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.Size = new System.Drawing.Size(131, 40);
            this.btnConnect.TabIndex = 0;
            this.btnConnect.Text = "Connect";
            this.btnConnect.UseVisualStyleBackColor = true;
            this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(45, 51);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(69, 20);
            this.label1.TabIndex = 8;
            this.label1.Text = "Server IP:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(35, 87);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(83, 20);
            this.label2.TabIndex = 9;
            this.label2.Text = "Server Port:";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(40, 124);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(78, 20);
            this.label3.TabIndex = 10;
            this.label3.Text = "Username:";
            // 
            // btnDisconnect
            // 
            this.btnDisconnect.Enabled = false;
            this.btnDisconnect.Location = new System.Drawing.Point(177, 162);
            this.btnDisconnect.Name = "btnDisconnect";
            this.btnDisconnect.Size = new System.Drawing.Size(131, 40);
            this.btnDisconnect.TabIndex = 11;
            this.btnDisconnect.Text = "Disconnect";
            this.btnDisconnect.UseVisualStyleBackColor = true;
            this.btnDisconnect.Click += new System.EventHandler(this.btnDisconnect_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(35, 212);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(129, 20);
            this.label4.TabIndex = 12;
            this.label4.Text = "Write your sweets:";
            // 
            // btnGetUsers
            // 
            this.btnGetUsers.Enabled = false;
            this.btnGetUsers.Location = new System.Drawing.Point(35, 314);
            this.btnGetUsers.Name = "btnGetUsers";
            this.btnGetUsers.Size = new System.Drawing.Size(124, 40);
            this.btnGetUsers.TabIndex = 13;
            this.btnGetUsers.Text = "Get all users";
            this.btnGetUsers.UseVisualStyleBackColor = true;
            this.btnGetUsers.Click += new System.EventHandler(this.btnGetUsers_Click);
            // 
            // btnAddUser
            // 
            this.btnAddUser.Enabled = false;
            this.btnAddUser.Location = new System.Drawing.Point(184, 412);
            this.btnAddUser.Name = "btnAddUser";
            this.btnAddUser.Size = new System.Drawing.Size(124, 40);
            this.btnAddUser.TabIndex = 14;
            this.btnAddUser.Text = "Follow";
            this.btnAddUser.UseVisualStyleBackColor = true;
            this.btnAddUser.Click += new System.EventHandler(this.btnAddUser_Click);
            // 
            // txtUserbox
            // 
            this.txtUserbox.AllowDrop = true;
            this.txtUserbox.Enabled = false;
            this.txtUserbox.Location = new System.Drawing.Point(35, 421);
            this.txtUserbox.Name = "txtUserbox";
            this.txtUserbox.Size = new System.Drawing.Size(143, 27);
            this.txtUserbox.TabIndex = 15;
            // 
            // button1
            // 
            this.button1.Enabled = false;
            this.button1.Location = new System.Drawing.Point(35, 582);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(273, 40);
            this.button1.TabIndex = 16;
            this.button1.Text = "Tweets of users you follow";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnFollowing
            // 
            this.btnFollowing.Enabled = false;
            this.btnFollowing.Location = new System.Drawing.Point(184, 360);
            this.btnFollowing.Name = "btnFollowing";
            this.btnFollowing.Size = new System.Drawing.Size(124, 40);
            this.btnFollowing.TabIndex = 17;
            this.btnFollowing.Text = "Following";
            this.btnFollowing.UseVisualStyleBackColor = true;
            this.btnFollowing.Click += new System.EventHandler(this.btnFollowing_Click);
            // 
            // btnFollowers
            // 
            this.btnFollowers.Enabled = false;
            this.btnFollowers.Location = new System.Drawing.Point(35, 360);
            this.btnFollowers.Name = "btnFollowers";
            this.btnFollowers.Size = new System.Drawing.Size(124, 40);
            this.btnFollowers.TabIndex = 18;
            this.btnFollowers.Text = "Followers";
            this.btnFollowers.UseVisualStyleBackColor = true;
            this.btnFollowers.Click += new System.EventHandler(this.btnFollowers_Click);
            // 
            // txtDelete
            // 
            this.txtDelete.AllowDrop = true;
            this.txtDelete.Enabled = false;
            this.txtDelete.Location = new System.Drawing.Point(35, 476);
            this.txtDelete.Name = "txtDelete";
            this.txtDelete.Size = new System.Drawing.Size(143, 27);
            this.txtDelete.TabIndex = 20;
            // 
            // btnDelete
            // 
            this.btnDelete.Enabled = false;
            this.btnDelete.Location = new System.Drawing.Point(184, 468);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(124, 40);
            this.btnDelete.TabIndex = 19;
            this.btnDelete.Text = "Delete sweet";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // txtBlock
            // 
            this.txtBlock.Enabled = false;
            this.txtBlock.Location = new System.Drawing.Point(35, 536);
            this.txtBlock.Margin = new System.Windows.Forms.Padding(2);
            this.txtBlock.Name = "txtBlock";
            this.txtBlock.Size = new System.Drawing.Size(143, 27);
            this.txtBlock.TabIndex = 21;
            // 
            // blockButton
            // 
            this.blockButton.Enabled = false;
            this.blockButton.Location = new System.Drawing.Point(184, 527);
            this.blockButton.Margin = new System.Windows.Forms.Padding(2);
            this.blockButton.Name = "blockButton";
            this.blockButton.Size = new System.Drawing.Size(124, 36);
            this.blockButton.TabIndex = 22;
            this.blockButton.Text = "Block user";
            this.blockButton.UseVisualStyleBackColor = true;
            this.blockButton.Click += new System.EventHandler(this.blockButton_Click);
            // 
            // btn_my_sweets
            // 
            this.btn_my_sweets.Enabled = false;
            this.btn_my_sweets.Location = new System.Drawing.Point(184, 314);
            this.btn_my_sweets.Name = "btn_my_sweets";
            this.btn_my_sweets.Size = new System.Drawing.Size(124, 40);
            this.btn_my_sweets.TabIndex = 23;
            this.btn_my_sweets.Text = "Get my sweets";
            this.btn_my_sweets.UseVisualStyleBackColor = true;
            this.btn_my_sweets.Click += new System.EventHandler(this.btn_my_sweets_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(795, 634);
            this.Controls.Add(this.btn_my_sweets);
            this.Controls.Add(this.blockButton);
            this.Controls.Add(this.txtBlock);
            this.Controls.Add(this.txtDelete);
            this.Controls.Add(this.btnDelete);
            this.Controls.Add(this.btnFollowers);
            this.Controls.Add(this.btnFollowing);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.txtUserbox);
            this.Controls.Add(this.btnAddUser);
            this.Controls.Add(this.btnGetUsers);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.btnDisconnect);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.btnSend);
            this.Controls.Add(this.btnGetSweet);
            this.Controls.Add(this.txtSweet);
            this.Controls.Add(this.txtUsername);
            this.Controls.Add(this.txtPort);
            this.Controls.Add(this.txtLog);
            this.Controls.Add(this.txtIP);
            this.Controls.Add(this.btnConnect);
            this.Name = "Form1";
            this.Text = "Form1";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private TextBox txtIP;
        private RichTextBox txtLog;
        private TextBox txtPort;
        private TextBox txtUsername;
        private TextBox txtSweet;
        private Button btnGetSweet;
        private Button btnSend;
        private Button btnConnect;
        private Label label1;
        private Label label2;
        private Label label3;
        private Button btnDisconnect;
        private Label label4;
        private Button btnGetUsers;
        private Button btnAddUser;
        private TextBox txtUserbox;
        private Button button1;
        private Button btnFollowing;
        private Button btnFollowers;
        private TextBox txtDelete;
        private Button btnDelete;
        private TextBox txtBlock;
        private Button blockButton;
        private Button btn_my_sweets;
    }
}