// Require the framework and instantiate it
const fastify = require('fastify')({
  logger: true
})


const name = 'ballsio'

// Declare a route
fastify.get('/', function (request, reply) {
  reply.send({ hello: 'world' }).status(200)
})
// Run the server!
fastify.listen(3000, function (err, address) {
  if (err) {
    fastify.log.error(err)
    process.exit(1)
  }
  fastify.log.info(`server listening on ${address}`)
})

