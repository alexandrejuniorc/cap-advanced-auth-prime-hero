using {capadvancedauth as my} from '../db/schema.cds';

@path: '/service/capadvancedauthService'
service capadvancedauthService {

    annotate Cliente with @restrict: [
        {
            grant: ['WRITE'],
            to   : ['any']
        },
        {
            grant: ['WRITE'],
            to   : ['authenticated-user']
        },
        {
            grant: [
                'WRITE',
                'READ'
            ],
            to   : ['cliente']
        },
    ];


    entity ClienteView as select from my.Cliente;

    @cds.redirection.target
    @odata.draft.enabled
    entity Cliente     as projection on my.Cliente;
}

annotate capadvancedauthService with @requires: ['authenticated-user'];
