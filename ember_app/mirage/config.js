export default function() {
  
  this.namespace = '/api';
  this.get('/spies', function() {
    return {
      data: [{
        type: 'spy',
        id: '001',
        attributes: {
          name: 'Battlefield 1',
          city: 'New York',
          type: 'Shooter',
          image: 'https://content.pulse.ea.com/content/battlefield-portal/es_ES/news/battlefield-1/battlefield-1-reveal/_jcr_content/body/image/renditions/rendition1.img.jpg'
        }
      }, {
        type: 'spy',
        id: '002',
        attributes: {
          name: 'Final Fantasy XV',
          city: 'Tokyo',
          type: 'JRPG',
          image: 'http://vignette4.wikia.nocookie.net/finalfantasy/images/3/33/Final-Fantasy-XV_Cover_(2016).jpg/revision/latest?cb=20160713205720'
        }
      }, {
        type: 'spy',
        id: '003',
        attributes: {
          name: 'God of War',
          city: 'Santa Monica',
          type: 'Hack and slash',
          image: 'http://i11c.3djuegos.com/juegos/11552/god_of_war_ps4__nombre_temporal_/fotos/set/god_of_war_ps4__nombre_temporal_-3420023.jpg'
        }
      }]
    };
  });

  // Find and return the provided spy from our spy list above
}
