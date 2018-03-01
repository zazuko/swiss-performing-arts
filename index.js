const p = require('barnard59')
const path = require('path')
const moment = require('moment')

function convertCsvw (filename) {
  const filenameInput = 'input/' + filename
  const filenameMetadata = filenameInput + '-metadata.json'
  const filenameOutput = 'target/' + path.dirname(filename) + '/' + path.basename(filename, '.csv') + '.nt'

  const pm = p.rdf.prefixMap({
    cidoc: 'http://www.cidoc-crm.org/cidoc-crm/',
    dcterms: 'http://purl.org/dc/terms/',
    edm: 'http://www.europeana.eu/schemas/edm/',
    foaf: 'http://xmlns.com/foaf/0.1/',
    frbr: 'http://purl.org/vocab/frbr/core#',
    frbroo: 'http:/example.org/frbroo/',
    premis: 'http://www.loc.gov/premis/rdf/v1#',
    rdac: 'http://rdaregistry.info/Elements/c/',
    ric: 'http://example.org/will-be-ric/',
    schema: 'http://schema.org/',
    skos: 'http://www.w3.org/2004/02/skos/core#',
    wd: 'http://www.wikidata.org/entity/'
  })

  return p.rdf.dataset().import(p.file.read(filenameMetadata).pipe(p.jsonld.parse())).then((metadata) => {
    p.file.read(filenameInput)
      .pipe(p.csvw.parse({
        baseIRI: 'file://' + filename,
        metadata: metadata
      }))
      .pipe(p.filter((quad) => {
        if (quad.predicate.value === 'http://vocab.performing-arts.ch/firstPerformanceDate' && !moment(quad.object.value).isValid()) {
          console.error('Wrong date:' + quad.object.value)
          return false
        }
        return true
      }))
      .pipe(p.filter((quad) => {
        return quad.object.value !== '-'
      }))
      .pipe(p.map((quad) => {
        let subject = quad.subject
        let predicate = quad.predicate
        let object = quad.object

        let quads = []

        if (predicate.value === 'http://example.org/equivalentClass') {
          const curies = object.value.split(';')
          curies.forEach(element => {
            // some URIs still contain spaces -> we simply remove them. Probably breaks the URI though
            quads.push(p.rdf.quad(subject, p.rdf.namedNode('http://www.w3.org/2002/07/owl#equivalentClass'), pm.resolve(element.trim().replace(' ', ''))))
          })
        }

        if (predicate.value === 'http://vocab.performing-arts.ch/r_hasDate') {
          object = p.rdf.literal(object.value.trim().split()[0].trim())
        }

        if (predicate.value === 'http://vocab.performing-arts.ch/firstPerformanceDate') {
          const xsddate = 'http://www.w3.org/2001/XMLSchema#date'

          const date = moment(object.value).format('YYYY-MM-DD')

          object = p.rdf.literal(date, p.rdf.namedNode(xsddate))
        }

        quads.push(p.rdf.quad(subject, predicate, object))

        return quads
      }))
      .pipe(p.flatten())
      .pipe(p.ntriples.serialize())
      .pipe(p.file.write(filenameOutput))
  })
}

const filenames = [
  'STS/Entwuerfe.csv',
  'STS/Masken.csv',
  'STS/Modelle.csv',
  'STS/Plakate.csv',
  'STS/RepProfi.csv',
  'STS/stc_amateur_theatre_companies.csv',
  'STS/stc_anniversary_performing_arts_festivals.csv',
  'STS/stc_circuses.csv',
  'STS/stc_outdoor_theatre_events.csv',
  'STS/stc_performing_arts_festivals.csv',
  'STS/stc_professional_performing_arts_companies.csv',
  'STS/stc_puppet_theatre_companies.csv',
  'STS/stc_revues_cultural_nights_vorfasnacht.csv',
  'SPA_Classes.csv',
  'SPA_Qualifiers.csv',
  'SPA_Relations.csv',
  'SPA_Attributes.csv'
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
