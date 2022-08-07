-- ## 3dme : shared config file

Config = {
    language = 'en',
    visual = {
        color = { r = 255, g = 255, b = 255, a = 1000 }, -- Text color { r = 230, g = 230, b = 230, a = 255 }
        font = 0, -- Text font
        time = 5000, -- Duration to display the text (in ms)
        scale = 0.5, -- Text scale
        dist = 250, -- Min. distance to draw 
    },
}

Languages = {
    ['en'] = {
        commandName = 'me',
        commandDescription = 'Cselekvés',
        commandSuggestion = {{ name = 'cselekvés', help = ''}},
        prefix = ''
    },
    ['fr'] = {
        commandName = 'me',
        commandDescription = 'Affiche une action au dessus de votre tête.',
        commandSuggestion = {{ name = 'action', help = '"se gratte le nez" par exemple.'}},
        prefix = 'l\'individu '
    },
}
