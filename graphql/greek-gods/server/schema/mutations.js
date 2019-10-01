const graphql = require("graphql");
const {
  GraphQLObjectType,
  GraphQLString,
  GraphQLInt,
  GraphQLID,
  GraphQLList
} = graphql;
const mongoose = require("mongoose");
const God = mongoose.model("god");
const Abode = mongoose.model("abode");
const GodType = require("./god_type");
const AbodeType = require('./abode_type');
// this will be the where we will create all of the mutations for our application
const mutation = new GraphQLObjectType({
  // we give it a name
  name: "Mutation",
  // then in the fields we will enter all of our different mutations
  fields: {
     // we are naming our filed - and therefore our mutation `newGod`
     newGod: {
       // we just specify the type we are mutating - in the case of making
       // a new God this will be the GodType
       type: GodType,
       args: {
         // the arguments required for this mutation
         name: {
           type: GraphQLString
         },
         type: {
           type: GraphQLString
         },
         description: {
           type: GraphQLString
         }
       },
       // here we are just destructing our arguments
       resolve(parentValue, {
         name,
         type,
         description
       }) {
         return new God({
           name,
           type,
           description
         }).save();
       }
     },
     updateGodAbode: {
      type: GodType,
      args: {
        id: {
          type: GraphQLID
        },
        name: {
          type: GraphQLString
        }
      },
      resolve(parentValue, {
        id, 
        name
        
      }) {
        const updateAbode = {};
        updateAbode.id = id;
        if (name) updateAbode.name = name;
        return God.findOneAndUpdate({
          _id: id
        }, {
          $set: updateAbode
        }, {
          new: true
        }, (err, god) => {
          return god;
        });
      }
     },
     addGodDomain: {
      type: GodType,
      args: {
        godId: {
          type: GraphQLID
        },
        domain: {
          type: GraphQLString
        }
      },
      resolve(parentValue, {godId, domain }){
        return God.addDomain(godId, domain);
         }
      },
      removeGodDomain: {
        type: GodType,
        args: {
          godId: {
            type: GraphQLID
          },
          domain: {
            type: GraphQLString
          }
        },
        resolve(parentValue, {
          godId,
          domain
        }) {
          return God.removeDomain(godId, domain);
        }
      },
     updateGod: {
       type: GodType,
       args: {
         id: {
           type: GraphQLID
         },
         name: {
           type: GraphQLString
         },
         type: {
           type: GraphQLString
         },
         description: {
           type: GraphQLString
         }
       },
       resolve(parentValue, {
         id,
         name,
         type,
         description
       }) {
         const updateObj = {};
         // we can create our own object here and pass in the variables is they exist
         updateObj.id = id;
         if (name) updateObj.name = name;
         if (type) updateObj.type = type;
         if (description) updateObj.description = description;

         return God.findOneAndUpdate({
           _id: id
         }, {
           $set: updateObj
         }, {
           new: true
         }, (err, god) => {
           return god;
         });
       }
     },
     addGodRelative: {
       type: GodType,
       args: {
         godId: {
           type: GraphQLID
         },
         relativeId: {
           type: GraphQLID
         },
         relationship: {
           type: GraphQLString
         }
       },
       resolve(parentValue, {
         godId,
         relativeId,
         relationship
       }) {
         return God.addRelative(godId, relativeId, relationship);
       }
     },
      removeGodRelative: {
        type: GodType,
        args: {
          godId: {
            type: GraphQLID
          },
          relativeId: {
            type: GraphQLID
          }
      },
        resolve(parentValue, {
          godId,
          relativeId
        }) {
          return God.removeRelative(godId, relativeId);
        }
      },
      addGodEmblem: {
        type: GodType,
        args: {
          godId: {
            type: GraphQLID
          },
          emblemId: {
            type: GraphQLID
          },
        },
        resolve(parentValue, {
          godId,
          emblemId
        }) {
          return God.addEmblem(godId, emblemId);
        }
      },
      removeGodEmblem: {
        type: GodType,
        args: {
          godId: {
            type: GraphQLID
          },
          emblemId: {
            type: GraphQLID
          },
        },
        resolve(parentValue, {
          godId,
          emblemId
        }) {
          return God.removeEmblem(godId, emblemId);
        }
      },
       newAbode: {
         // we just specify the type we are mutating - in the case of making
         // a new God this will be the GodType
         type: AbodeType,
         args: {
           // the arguments required for this mutation
           name: {
             type: GraphQLString
           },
           coordinates: {
             type: GraphQLString
           }
         },
         // here we are just destructing our arguments
         resolve(parentValue, {
           name,
           coordinates
         }) {
           return new Abode({
             name,
             coordinates
           }).save();
         }
       },
    }
});

module.exports = mutation;