# Price Compare
This is a project in which you can compare prices of a product from multiple web sources. Just like on Trivago
website, we can compare the hotel prices, similarly, we can compare the prices of a product on websites like Amazon,
Snapdeal, Flipkart, etc and display the best offers.

## Local Setup

In order to create content you obviously need to run things locally to validate various things. This is also commonly
called a Devel (development made short cause lazy) env. Local setup should need some setup at first but overall be
fairly simple and manageable.

This local env should be OS agnostic.

### Things to Install (this assume the repo is already cloned)

first you will need to install python3, docker, and docker-compose.

Linux:
`sudo yum install docker-ce docker-ce-cli containerd.io`

After install verify install.

```
docker --version
docker-compose --version
```

NOTE: You will need to make sure whatever user you are running this as has permissions to run docker commands.

Create a directory directly with your repo called postgres-data.

```
(base) [mhorch@p20 data01]$ ll
total 8
drwx------. 19 mhorch mhorch 4096 Jan 28 16:13 postgres-data
drwxrwxr-x.  5 mhorch mhorch 4096 Jan 28 16:05 price_compare
```

Once this is done you should be ready to fire up the containers with docker compose. We will be using the
docker-compose_local.yml

```
docker-compose -f docker-compose_local.yml -p local up -d --build
```

if you need to bring all of the containers down.

```
docker-compose -f docker-compose_local.yml -p local down
```

NOTE: in the event that everyhting does not work the first time, run the above down command and then run the above up
command. I will need to create a wait_for_it.sh script that waits for the database to initialize for first time builds.

Once this is complete run the logs command on your local_web container.

```
(base) [mhorch@p20 data01]$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
9ec114c60586        local_web           "python p20/manage.p…"   15 minutes ago      Up 15 minutes       0.0.0.0:8000->8000/tcp   local_web_1
4a631fc200eb        postgres            "docker-entrypoint.s…"   15 minutes ago      Up 15 minutes       5432/tcp                 local_db_1

(base) [mhorch@p20 data01]$ docker logs -f 9ec114c60586
```

This will validate that your local django is up.

```
(base) [mhorch@p20 data01]$ docker logs -f 9ec114c60586
Watching for file changes with StatReloader
Performing system checks...

System check identified no issues (0 silenced).

You have 17 unapplied migration(s). Your project may not work properly until you apply the migrations for app(s):
admin, auth, contenttypes, sessions.
Run 'python manage.py migrate' to apply them.
January 28, 2020 - 21:14:02
Django version 3.0.2, using settings 'p20.settings.local'
Starting development server at http://0.0.0.0:8000/
Quit the server with CONTROL-C.
```

If you are at this point on your local computer open you favorite browser and navigate to:

`http://<your_ip>:8000`

you should see the congratulations banner.
