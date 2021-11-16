function fn() {
  var env = karate.env; // get system property 'karate.env'
  var company = karate.properties['karate.company'];

  if (!env) {
    env = 'uat';
  }
  if (!company) {
      company = 'facebook';
    }
  karate.log('karate.env system property was:', env);
  karate.log('karate.company system property was:', company);


  var config = {
    env: env,
    _myVarName:'someValue',
    _key: '38e7987a4fa0c6195e8c27df9d27c099',
    _token: '25c156a6489e519ab5e799bfbf14601721a4438835ea2c1efbb9cca7c4248ad3',
    _url:'https://trello.com',
    _headers: {
                'Accept-language':'es',
                'transaction-id':'12321121432wgefgfgfgfd'
    },
    _path:'classpath:trello/reusables/',
    _responseTime:'0'
  }



  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config._url='https://trello.com',
    config._key= '38e7987a4fa0c6195e8c27df9d27c099',
    config._token= '25c156a6489e519ab5e799bfbf14601721a4438835ea2c1efbb9cca7c4248ad3'
  } else if (env == 'uat') {
    // customize
    config._url='https://api.trello.com',
    config._key= '38e7987a4fa0c6195e8c27df9d27c099',
    config._token= '25c156a6489e519ab5e799bfbf14601721a4438835ea2c1efbb9cca7c4248ad3'
  }
  else if (env == 'pre-prod') {
      // customize
      config._url='https://api.trello.com',
      config._key= '38e7987a4fa0c6195e8c27df9d27c099',
      config._token= '25c156a6489e519ab5e799bfbf14601721a4438835ea2c1efbb9cca7c4248ad3'
    }

  karate.configure('connectTimeout', 60000);
  karate.configure('readTimeout', 30000);
  //karate.configure('ssl', true);

  return config;
}