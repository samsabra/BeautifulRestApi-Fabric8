FROM microsoft/dotnet:1.1-sdk
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet new
RUN dotnet restore
# --no-cache

# copy and build everything else
COPY . ./
RUN dotnet publish -c Release -o out
ENTRYPOINT ["dotnet", "/app/bin/Release/netcoreapp1.1/dotnetapp.dll"]
EXPOSE 5000