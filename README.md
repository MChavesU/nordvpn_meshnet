# MESHNET
This guide is a pretty easy way to have a docker container running nordvpn meshnet so you can access your local server from outside your local network

# PRE REQUISITES
You will need docker engine, please go here and download your OS version https://www.docker.com/

You will need a token from your nordvpn account.

Once docker engine is installed, use docker network inspect bridge to get your docker brigde ip
<img width="445" height="291" alt="image" src="https://github.com/user-attachments/assets/99d6d4bc-a09a-412a-bef3-e539a2529dc5" />

# GETTING NORDVPN TOKEN
Go to [nordvpn.com](https://nordvpn.com/) login, look for Meshnet.
<img width="1110" height="375" alt="image" src="https://github.com/user-attachments/assets/d88fa90a-96e9-4d81-b702-20c92d24855d" />

Then find access token, and hit get access token.
<img width="1142" height="277" alt="image" src="https://github.com/user-attachments/assets/64365c65-c368-4c78-a6de-03dc95b8d2ba" />

Once you click get access token, they will ask you to put a 6 digit number that was send to your email.

Hit create new access token.
<img width="1073" height="161" alt="image" src="https://github.com/user-attachments/assets/41162687-8589-42ee-ac5c-e642a3acfeea" />

You have two options here, if the token expire or not, please select the one that you need, and hit generate token.

Then you will see your token, hit copy and close, so you will copy the token, you can save it in a .txt file.
<img width="697" height="385" alt="image" src="https://github.com/user-attachments/assets/a44655e8-0637-4004-bfbb-e154ccd2ab22" />

# INSTALLATION AND LOGIN
Once you have the token saved in a text file, pull the repo.

And use the next command from a terminal or cmd "docker-compose up -d" this will build and start all the services.

Now, you can use the command "docker exec -it meshnet nordvpn status" this will return a Disconnect, or an error, if it returns an error,
the nordvpn daemon is running, if not, please run "docker exec -it meshnet /etc/init.d/nordvpn start" this will start the nordvpn daemon.

Now, once you check your daemon is working, use this next command "docker exec -it meshnet nordvpn login -token YOURTOKEN" remove YOURTOKEN and paste the token you have in the .txt.

Once the login is complete, next commmand is "docker exec -it meshnet nordvpn meshnet set on", this will connect the container to your meshnet net.

# NPM

Now, we are going to set NPM (nginx proxy manager) to work with multiple domain names.

Use the ip of the pc or server that is running the docker containers + the port of NPM example 192.168.0.10:30081

You will see a page where you can put your email address and password so you can login into NPM.

Once you are in, you will see a page like this:
<img width="1460" height="360" alt="image" src="https://github.com/user-attachments/assets/d1a19758-d547-439c-8916-529b797d7048" />
You will see a 0 in the proxy hosts, please click that option.

Now, we need to add a domain by clicking Add Proxy Host
<img width="1348" height="259" alt="image" src="https://github.com/user-attachments/assets/2c9192df-69c4-462e-b2bb-a309861cd95b" />

On the Domain Names input, put your nordvpn meshnet domain name, you can get it using "docker exec -it meshnet nordvpn meshnet peer list"
<img width="584" height="140" alt="image" src="https://github.com/user-attachments/assets/8caf7c08-8b9a-4056-b2ac-14eacff8c8e0" />

Now, once you put the domain, put hit on create, and add your docker bridge network gateway, it is usally the ip address that finishes with a .1, then add the Scheme, http, since we are not using let's encrypt, the gateway ip, and our heimdall port
<img width="534" height="636" alt="image" src="https://github.com/user-attachments/assets/85839a24-61aa-4a28-836d-5f714e9ef1b3" />

Now, we can use the same idea to add other services.
<img width="1276" height="835" alt="image" src="https://github.com/user-attachments/assets/2dc547e7-e1fb-448d-8d1d-cea42f8219c5" />

Now we have 2 options here we can use a mobile device or a pc/laptop, both need to be connected to meshnet, to make this easier, please use a mobile device, install nordvpn, and activate nordvpn meshnet.
Then open the browser and put http://yourdomain.nord and you will see the landing page.

Important: if you are going to use a pc, you will need to change the C:Windows\System32\drivers\etc\hosts file or the known_hosts in linux, you will need to add the domain names here, since your PC is not going to be able to solve the domain name without this.

# HEIMDALL

Here we can add applications, so, we need to click here
<img width="1771" height="701" alt="image" src="https://github.com/user-attachments/assets/94694c6f-5cc8-45bf-bf69-951dc1ad2e03" />

You will see a template, so, we can select any app in heimdall, or add our custom icon and name, for the URL, please use the domain name that you create for your applications in NPM, like jellyfin.domain.nord then hit save and you will see the new app there.
<img width="1021" height="830" alt="image" src="https://github.com/user-attachments/assets/b00fe1de-fccb-4486-8f54-424d2b7c50a4" />

With the app in HEIMDALL, click it, if everything was set in the right way, you will be redirected to the app landing page.
