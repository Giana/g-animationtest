local QBCore = exports['qb-core']:GetCoreObject()

-- Functions --

local function getFlagMenu(commandArgs)
    local menu = {
        {
            header = Lang:t('menu.flag_header'),
            isMenuHeader = true
        },
        {
            header = Lang:t('menu.flag_bullet_0'),
            params = {
                event = 'g-animationtest:client:startAnimation',
                args = {
                    flag = 0,
                    commandArgs = commandArgs
                }
            }
        },
        {
            header = Lang:t('menu.flag_bullet_1'),
            params = {
                event = 'g-animationtest:client:startAnimation',
                args = {
                    flag = 1,
                    commandArgs = commandArgs
                }
            }
        },
        {
            header = Lang:t('menu.flag_bullet_2'),
            params = {
                event = 'g-animationtest:client:startAnimation',
                args = {
                    flag = 2,
                    commandArgs = commandArgs
                }
            }
        },
        {
            header = Lang:t('menu.flag_bullet_16'),
            params = {
                event = 'g-animationtest:client:startAnimation',
                args = {
                    flag = 16,
                    commandArgs = commandArgs
                }
            }
        },
        {
            header = Lang:t('menu.flag_bullet_32'),
            params = {
                event = 'g-animationtest:client:startAnimation',
                args = {
                    flag = 32,
                    commandArgs = commandArgs
                }
            }
        },
        {
            header = Lang:t('menu.flag_bullet_120'),
            params = {
                event = 'g-animationtest:client:startAnimation',
                args = {
                    flag = 120,
                    commandArgs = commandArgs
                }
            }
        },
        {
            header = Lang:t('menu.flag_bullet_other'),
            params = {
                event = 'g-animationtest:client:takeFlagInput',
                args = {
                    commandArgs = commandArgs
                }
            }
        },
        {
            header = Lang:t('menu.exit_bullet'),
            params = {
                event = 'qb-menu:client:closeMenu'
            }
        }
    }
    return menu
end

-- Commands --

RegisterCommand(Config.AnimationTestCommand, function(source, args)
    QBCore.Functions.TriggerCallback('g-animationtest:server:isAllowedToTestAnimation', function(isAllowed)
        if isAllowed then
            if args and args[1] and args[2] then
                local menu = getFlagMenu(args)
                exports['qb-menu']:openMenu(menu)
            else
                QBCore.Functions.Notify(Lang:t('error.not_enough_arguments'), 'error')
            end
        else
            QBCore.Functions.Notify(Lang:t('error.not_authorized'), 'error')
        end
    end)
end)

-- Events --

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    TriggerServerEvent('g-animationtest:server:requestCommands')
end)

RegisterNetEvent('g-animationtest:client:requestCommands', function()
    TriggerEvent('chat:addSuggestion', '/' .. Config.AnimationTestCommand, Lang:t('other.test_animation'), { { name = Lang:t('other.anim_dict_name'), help = Lang:t('other.anim_dict_help') }, { name = Lang:t('other.animation_name_name'), help = Lang:t('other.animation_name_help') } })
end)

RegisterNetEvent('g-animationtest:client:startAnimation', function(data)
    local player = PlayerPedId()
    local args = data.commandArgs
    local animDictionary = tostring(args[1])
    local animationName = tostring(args[2])
    local flag = tonumber(data.flag)
    while not HasAnimDictLoaded(animDictionary) do
        RequestAnimDict(animDictionary)
        Wait(50)
    end
    if player then
        TaskPlayAnim(player, animDictionary, animationName, 8.0, 8.0, -1, flag, 0, false, false, false)
    else
        QBCore.Functions.Notify(Lang:t('error.get_player'), 'error')
    end
end)

RegisterNetEvent('g-animationtest:client:takeFlagInput', function(data)
    local input = {
        header = Lang:t('input.flag_header'),
        submitText = Lang:t('input.submit'),
        inputs = {
            {
                text = Lang:t('input.flag_field_text'),
                name = 'flag',
                type = 'number',
                isRequired = true
            }
        }
    }
    local inputResult = exports['qb-input']:ShowInput(input)
    local flag = inputResult.flag
    if not flag then
        QBCore.Functions.Notify(Lang:t('error.get_flag'), 'error')
        return
    end
    data.flag = flag
    TriggerEvent('g-animationtest:client:startAnimation', data)
end)