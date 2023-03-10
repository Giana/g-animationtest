local Translations = {
    error = {
        not_enough_arguments = 'Error: Not enough arguments provided',
        get_player = 'Error: Unable to get player',
        get_flag = 'Error: Unable to get flag',
        not_authorized = 'Error: Not authorized'
    },
    menu = {
        flag_header = 'Animation Flag Selection',
        flag_bullet_0 = '• Normal (0)',
        flag_bullet_1 = '• Repeat (1)',
        flag_bullet_2 = '• Stop last frame (2)',
        flag_bullet_16 = '• Upper body (16)',
        flag_bullet_32 = '• Enable player control (32)',
        flag_bullet_120 = '• Cancelable (120)',
        flag_bullet_other = '• Other',
        exit_bullet = '✖ Exit'
    },
    input = {
        flag_header = 'Input Animation Flag',
        submit = 'Submit',
        flag_field_text = 'Flag (#)'
    },
    other = {
        test_animation = 'Test an animation',
        anim_dict_name = 'animDictionary',
        anim_dict_help = 'Animation dictionary',
        animation_name_name = 'animationName',
        animation_name_help = 'Animation name'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})