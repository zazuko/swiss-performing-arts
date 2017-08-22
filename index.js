const p = require('barnard59')
const path = require('path')

function convertCsvw (filename) {
  const filenameInput = 'input/' + filename
  const filenameMetadata = filenameInput + '-metadata.json'
  const filenameOutput = 'target/' + path.basename(filename) + '/' + path.basename(filename, '.csv') + '.nt'

  return p.rdf.dataset().import(p.file.read(filenameMetadata).pipe(p.jsonld.parse())).then((metadata) => {
    p.file.read(filenameInput)
      .pipe(p.csvw.parse({
        baseIRI: 'file://' + filename,
        metadata: metadata
      }))
      .pipe(p.ntriples.serialize())
      .pipe(p.file.write(filenameOutput))
  })
}

const filenames = [
  // 'STS/Entwuerfe.csv',
  // 'STS/Masken.csv',
  // 'STS/Modelle.csv',
  // 'STS/Plakate.csv',
  // 'STS/RepProfi.csv',
  // 'STS/stc_amateur_theatre_companies.csv',
  // 'STS/stc_anniversary_performing_arts_festivals.csv',
  // 'STS/stc_circuses.csv',
  // 'STS/stc_outdoor_theatre_events.csv',
  // 'STS/stc_performing_arts_festivals.csv',
  // 'STS/stc_professional_performing_arts_companies.csv',
  // 'STS/stc_puppet_theatre_companies.csv',
  // 'STS/stc_revues_cultural_nights_vorfasnacht.csv',
  'SPA_Classes.csv'

]

p.run(() => {
  p.shell.mkdir('-p', 'target/STS/')

  return p.Promise.serially(filenames, (filename) => {
    console.log('convert: ' + filename)

    return convertCsvw(filename)
  })
}).then(() => {
  console.log('done')
}).catch((err) => {
  console.error(err.stack)
})
