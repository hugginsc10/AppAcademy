

mongorestore --host Cluster0-shard-0/cluster0-shard-00-00-5o2bt.mongodb.net:27017,cluster0-shard-00-01-5o2bt.mongodb.net:27017,cluster0-shard-00-02-5o2bt.mongodb.net:27017 --ssl --username dev --password fY9RDOSDMvC024mh --authenticationDatabase admin --db cluster0 abodes.bson



  
     "id": "5c98ea22d5a3ca0de10a1510",  
        "name": "Rhea" 

      },  
      {  
          "id": "5c98ea9bd5a3ca0de10a151a",  
        "name": "Zeus" 
      },  
      {  
          "id": "5c98eb56d5a3ca0de10a1529",  
        "name": "Hera"



{
    god(id: "5c98ea22d5a3ca0de10a1510"){
        name
        parents{
            name
        }
    }
}



mutation{
    removeRelative(godId: "5c98ea9bd5a3ca0de10a151a", relativeId: "5c98ea22d5a3ca0de10a1510"){
        name,
        parents{
            name
        },
        children{
            name
        }
    }
}