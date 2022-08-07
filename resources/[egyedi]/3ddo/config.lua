-- ## 3ddo : shared config file

Config = {
    language = 'en',
    visual = {
        color = { r = 255, g = 0, b = 0, a = 1000 }, -- Text color
        font = 0, -- Text font
        time = 5000, -- Duration to display the text (in ms)
        scale = 0.5, -- Text scale
        dist = 250, -- Min. distance to draw 
    },
}

Languages = {
    ['en'] = {
        commandName = 'do',
        commandDescription = 'Történés',
        commandSuggestion = {{ name = 'történés', help = ''}},
        prefix = ''
    },
    ['fr'] = {
        commandName = 'do',
        commandDescription = 'Affiche une action au dessus de votre tête.',
        commandSuggestion = {{ name = 'action', help = '"se gratte le nez" par exemple.'}},
        prefix = 'l\'individu '
    },
}
