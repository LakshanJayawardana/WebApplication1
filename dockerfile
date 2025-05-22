FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build

#Set working directory in the container
WORKDIR /src

#copy the dependecy file to the working directory
COPY . .

RUN dotnet publish "WebApplication1.csproj" -o /published /p:UseAppHost=false


FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine

WORKDIR /app

COPY --from=build /published .
#Run the application
ENTRYPOINT [ "dotnet","WebApplication1.dll" ]

