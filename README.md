### Test mermaid


```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```


```mermaid
flowchart LR

jenkins-dev[jenkins \nflyway-development]
jenkins-int[jenkins \nflyway-int]
jenkins-uat[jenkins \nflyway-uat]

subgraph sg-dev[DEV]
db-dev[(MainDB\n172.17.196.4)]
db.remote-dev[(RemoteDB\n172.17.196.9)]
db.sport-dev[(SportDB\n172.17.197.20:5432)]
end
db-dev -- partial\nlogical\nreplication --> db.remote-dev
db-dev -- partial\nlogical\nreplication --> db.sport-dev

subgraph sg-int[INT]
db-int[(MainDB\n172.17.197.104:5432)]
db.remote-int[(RemoteDB\n172.17.197.105)]
db.sport-int[(SportDB\n172.17.197.20:5433)]
end
db-int -- partial\nlogical\nreplication --> db.remote-int
db-int -- partial\nlogical\nreplication --> db.sport-int


subgraph UAT
db-uat[(MainDB\n172.17.197.200:5432)]
db.remote-uat[(RemoteDB\n172.17.197.204)]
db.sport-uat[(SportDB\n172.17.197.20:5434)]
end
db-uat -- partial\nlogical\nreplication --> db.remote-uat
db-uat -- partial\nlogical\nreplication --> db.sport-uat

jenkins-dev[jenkins \nflyway-development]
jenkins-int[jenkins \nflyway-int]
jenkins-uat[jenkins \nflyway-uat]

jenkins-dev -. jenkins phase 1 .-> db.remote-dev
jenkins-int -. jenkins phase 1 .-> db.remote-int
jenkins-uat -. jenkins phase 1 .-> db.remote-uat 

jenkins-dev -. jenkins phase 2 .-> db.sport-dev
jenkins-int -. jenkins phase 2 .-> db.sport-int 
jenkins-uat -. jenkins phase 2 .-> db.sport-uat 

jenkins-dev --jenkins phase 3--> db-dev 
jenkins-int --jenkins phase 3--> db-int 
jenkins-uat --jenkins phase 3--> db-uat 
```
