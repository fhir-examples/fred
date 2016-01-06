# FRED - FHIR Resource Editor

## What is FRED?
FRED is an open source web application that enables users to edit JSON [FHIR resources](https://www.hl7.org/fhir/resourcelist.html) and [FHIR bundles](https://www.hl7.org/fhir/bundle.html). Built as an HTML5 app, FRED runs entirely within your web browser - no data is sent to a server. *Note - the project is currently under active development. Code is rough, there are bugs and features may change or be removed!*

## Try it with...
- [A Patient Resource](http://docs.smarthealthit.org/fred/?resource=http%3A%2F%2Fdocs.smarthealthit.org%2Ffred%2Fsamples%2Flisa.json)
- [A Blood Pressure Resource](http://docs.smarthealthit.org/fred/?resource=http%3A%2F%2Fdocs.smarthealthit.org%2Ffred%2Fsamples%2Fbp.json)
- [An Official FHIR Example](http://docs.smarthealthit.org/dstu2-examples/?editorurl=http%3A%2F%2Fdocs.smarthealthit.org%2Ffred%2F)
- [Any Other FHIR Resource](http://docs.smarthealthit.org/fred/)

## Planned features
Please see [roadmap.md](roadmap.md)

## Tech
- App:
    - [React - UI Rendering](https://facebook.github.io/react/)
    - [React Bootstrap - UI widgets](https://react-bootstrap.github.io/)
    - [FreezerJs - Immutable data store](https://github.com/arqex/freezer)

- Build:
    - [NodeJs - Runtime](https://nodejs.org/)
    - [CoffeeScript - Language](http://coffeescript.org/)
    - [Webpack - Build tool](https://webpack.github.io/)
    - [Mocha - Testing library](https://mochajs.org/)

## Install FRED locally
1. Install NodeJs from https://nodejs.org

2. Clone this repository
    
    ```
    git clone https://github.com/smart-on-fhir/fred
    cd fred
    ```
    
3. Install the dependencies
    
    ```
    npm install
    ```
    
4. Run the dev server

    ```
    npm run dev
    ```
    
5. Browse to ```http://localhost:8080```

## Commands
| Action | Command |
| ------ | ------- |   
| Start Dev Server | ```npm run dev``` |
| Build Static JS Bundle | ```npm run build``` |
| Run Tests | ```npm run test``` |
| Run Tests on Edit | ```npm run test-watch``` |

## Building Resource Profiles
To reduce load time, FRED uses a simplified copy of the (15mb!) JSON FHIR resource profiles. To convert the FHIR resource profiles into this format, ensure the desired ```profile-resources.json``` and ```profile-types.json``` are in the fhir_profiles subdirectory and run ```npm run build-profiles```

## About
FRED is a project of [SMART Health IT](http://smarthealthit.org), a joint effort of the not-for-profit institutions, Boston Children’s Hospital Computational Health Informatics Program and the Harvard Medical School Department for Biomedical Informatics.
