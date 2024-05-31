FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build-env
WORKDIR /App

ARG HASH=688d0dace0877cc7a25fe23050bab3a8fb3e1338

RUN apt update ; apt install unzip wget -y
RUN wget "https://github.com/lyze237-forks/LogicReinc.BlendFarm/archive/${HASH}.zip"
RUN unzip "${HASH}.zip"

RUN mv "LogicReinc.BlendFarm-${HASH}" "/blendfarm"

WORKDIR /blendfarm
RUN dotnet restore

WORKDIR /blendfarm/LogicReinc.BlendFarm.Server
RUN dotnet publish -f net6.0 -c Release  -r linux-x64 -p:PublishSingleFile=true --self-contained true -o /out


FROM lscr.io/linuxserver/blender:latest

EXPOSE 15000

WORKDIR /blendfarm
COPY --from=build-env /out .
CMD "./LogicReinc.BlendFarm.Server"

