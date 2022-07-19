# VR Wedding Website

It consists of the frontend and cms part which is built in React JS and the backend part which is built in NodeJS.

## Getting Started
Please install docker and docker-compose first if it's not installed on your machine. [Click here](https://www.docker.com/get-started).

### Run
```bash
$ ./start.sh [OPTIONS...]
```

### Shut Down
```bash
$ ./stop.sh [OPTIONS...]
```

**Available OPTIONS**:
- -d : docker-compose detach. runs containers in background
- --build : Re-builds the images
- --sudo : To add `sudo` to `docker-compose` command
  
List of service ports:
- 80 : Frontend nginx
- 3000 : CMS nginx
- 8000 : Backend nginx
- 5432 : Postgres 

However, you may change the service ports from `.env` 
    
Make sure the related service ports are not used.

You can also use `docker-compose` command to run particular tasks, but it's encouraged to use the installer bash script instead (start.sh and stop.sh).
    
---

Thank you :)

*(P.S. Please refer to [Docker documentation](https://www.docker.com/get-started) to find out more how it works)*
