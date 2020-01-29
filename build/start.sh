#!/bin/sh
cd /usr/lib/codidact/src/WebUI
if [ `psql --username=postgres --host=db -l | grep codidact | wc -l` -le 0 ]; then
    dotnet tool install --global dotnet-ef
    dotnet ef database update
fi
dotnet run
