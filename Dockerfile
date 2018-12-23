FROM swift:4.2
USER root
LABEL "com.github.actions.name"="SwiftPM-GitHubAction"
LABEL "com.github.actions.description"="Testing Swift Packages with Github Actions"
LABEL "com.github.actions.icon"="airplay"
LABEL "com.github.actions.color"="orange"
LABEL "repository"="http://github.com/shashikant86/SwiftPM-GitHubAction"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Shashikant Jagtap <shashikant.jagtap@icloud.com>"
RUN apt-get update && apt-get install -y git
RUN mkdir /SwiftPM-GitHubAction
WORKDIR /SwiftPM-GitHubAction
COPY . /SwiftPM-GitHubAction
# ENTRYPOINT ["/SwiftPM-GitHubAction/entrypoint.sh"]
