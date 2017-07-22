const p = require('barnard59')

p.run(() => {
  p.shell.mkdir('-p', 'output/STS/')

  return p.rdf.dataset().import(p.file.read('input/STS/Entwuerfe.csv-metadata.json').pipe(p.jsonld.parse()))
}).then((metadata) => {
  p.file.read('input/STS/Entwuerfe.csv')
    .pipe(p.csvw.parse({
      metadata: metadata
    }))
    .pipe(p.ntriples.serialize())
    .pipe(p.file.write('output/STS/Entwuerfe.nt'))
}).then(() => {
  console.log('done')
}).catch((err) => {
  console.error(err.stack)
})
