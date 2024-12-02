# ใช้ Node.js image เป็น base
FROM node:18

# กำหนด Working Directory
WORKDIR /usr/src/app

# คัดลอกไฟล์ package.json และ package-lock.json
COPY package*.json ./

# ติดตั้ง dependencies
RUN npm install

# คัดลอกไฟล์ทั้งหมดในโปรเจกต์ไปยัง container
COPY . .

# Build NestJS app
RUN npx prisma generate

# เปิดพอร์ตที่ NestJS ใช้ (โดยปกติคือ 3000)
EXPOSE 8000

# คำสั่งเริ่มต้นสำหรับ container
CMD ["npm", "run", "start:dev"]




#  The  Dockerfile  is a text file that contains all the commands a user could call on the command line to assemble an image. Using  docker build  users can create an automated build that executes several command-line instructions in succession. 
#  The  FROM  instruction initializes a new build stage and sets the Base Image for subsequent instructions. 
#  The  WORKDIR  instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile. 
#  The  COPY  instruction copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>. 
#  The  RUN  instruction will execute any commands in a new layer on top of the current image and commit the results. 
#  The  EXPOSE  instruction informs Docker that the container listens on the specified network ports at runtime. 
#  The  CMD  instruction provides defaults for an executing container. 
#  Step 3: Build the Docker image 
#  To build the Docker image, run the following command: 
#  $ docker build -t node-web-app . 
#  The  -t  flag lets you tag your image so it’s easier to find later using the  docker images  command. 
#  Step 4: Run the Docker container 
#  To run the Docker container, execute the following command: 
#  $ docker run -p 49160:8080 -d node-web-app 
#  The  -d  flag runs the container in detached mode, leaving the container running in the background. The  -p  flag maps the port running inside the container to the specified port on the host machine. 
#  Step 5: Test the application 
#  To test the application, navigate to  http://localhost:49160  in your web browser. You should see the following output: 
#  Hello World! 
#  Conclusion 
#  In this tutorial, you learned how to create a simple Node.js application and containerize it using Docker. You also learned how to build and run the Docker container. 
#  To learn more about Docker, check out our  Docker topic page. 
#  Join our DigitalOcean community of over a million developers for free! Get help and share knowledge in our Questions & Answers section, find tutorials and tools that will help you grow as a developer and scale your project or business, and subscribe to topics of interest. 
#  Docker is a containerization platform that packages your application and all its dependencies together in the form of containers so that the application works seamlessly in
