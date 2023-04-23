local Fastbots_function, function_core, update_functions, Fastbots_timer = {}, {}, {}, {}
local Fastbots = {
  get_update = true,
  logo = [[

]],

colors_key = {
  reset =      0,
  bright     = 1,
  dim        = 2,
  underline  = 4,
  blink      = 5,
  reverse    = 7,
  hidden     = 8,
  black     = 30,
  red       = 31,
  green     = 32,
  yellow    = 33,
  blue      = 34,
  magenta   = 35,
  cyan      = 36,
  white     = 37,
  blackbg   = 40,
  redbg     = 41,
  greenbg   = 42,
  yellowbg  = 43,
  bluebg    = 44,
  magentabg = 45,
  cyanbg    = 46,
  whitebg   = 47
},
  config = {
  }
}
function SendTg(Methods)local Base ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'  Methods = string.gsub(Methods, '[^'..Base..'=]', '')    return (Methods:gsub('.', function(x)      if (x == '=') then        return ''      end      local r,f='',(Base:find(x)-1)      for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end      return r;    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)      if (#x ~= 8) then        return ''      end      local c=0      for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end      return string.char(c)    end))  end 
--local Fastbots =  require('Fastbots') 
local Fastt =  require('tdlua') 
local client = Fastt()
URL = require("./libs/url")
https = require("ssl.https")
----------------------------------------------- Fastbots core function
function function_core._CALL_(update)
  if update and type(update) == 'table' then
    for i = 0 , #update_functions do
      if not update_functions[i].filters then
        send_update = true
        update_message = update
      elseif update.Fastbots and update_functions[i].filters and Fastbots_function.in_array(update_functions[i].filters,  update.Fastbots) then
        send_update = true
        update_message = update
      else
        send_update = false
      end
      if update_message and send_update and type(update_message) == 'table' then
        xpcall(update_functions[i].def, function_core.print_error, update_message)
      end
      update_message = nil
      send_update = nil
    end
  end
end
function err(e)
  return e .. " " .. debug.traceback()
end
function xvid(params, cb, extra)
    local res = client:execute(params)
    if type(cb) == "function" then
        if type(res) == "table" then
            local ok, rres = xpcall(cb, err, extra, res)
            if not ok then
                print("Result cb failed", rres, debug.traceback())
                return false
            end
            return true
        end
    end
end

function xnxx()
    return xvid
end
function Fastbots_function.vardump(input)
  local function vardump(value)
     if type(value) == 'table' then
        local dump = '{\n'
        for key,v in pairs(value) do
           if type(key) == 'number' then
             key = '['..key..']'
           elseif type(key) == 'string' and key:match('@') then
             key = '["'..key..'"]'
           end
           if type(v) == 'string' then
             v = "'" .. v .. "'"
           end
           dump = dump .. key .. ' = ' .. vardump(v) .. ',\n'
        end
        return dump .. '}'
     else
        return tostring(value)
     end
   end
  print(Fastbots_function.colors('%{underline} Method information : %{reset}\n\n%{yellow}'..vardump(input)))
  return vardump(input)
end
function function_core.change_table(input, send)
  if send then
    changes ={
      Fastbots = string.reverse('epyt@')
    }
    rems = {
    }
  else
    changes = {
      _ = string.reverse('stobtsaF'),
    }
    rems = {
      string.reverse('epyt@')
    }
  end
  if type(input) == 'table' then
    local res = {}
    for key,value in pairs(input) do
      for k, rem in pairs(rems) do
        if key == rem then
          value = nil
        end
      end
      local key = changes[key] or key
      if type(value) ~= 'table' then
        res[key] = value
      else
        res[key] = function_core.change_table(value, send)
      end
    end
    return res
  else
 
    return input
  end
end
function function_core.run_table(input)
  local to_original = function_core.change_table(input, true)
  local result = client:execute(to_original)
  if type(result) ~= 'table' then
    return nil
  else
    return function_core.change_table(result)
  end
end
function function_core.print_error(err)
  print(Fastbots_function.colors('%{blue}\27[5m There is an error in the file, please correct it %{reset}\n\n%{red}'.. err))
end
function function_core.send_tdlib(input)
  local to_original = function_core.change_table(input, true)
  client:send(to_original)
end
function sendxnxx(input)
local to_original = function_core.change_table(input, true)
client:send(to_original)
end
function sendlib()
return sendxnxx
end
function_core.send_tdlib{
  Fastbots = 'getAuthorizationState'
}
Fastt.setLogLevel(3)
Fastt.setLogPath('/usr/lib/x86_64-linux-gnu/lua/5.2/.Fastbots.log')
-----------------------------------------------Fastbots_function
function Fastbots_function.len(input)
  if type(input) == 'table' then
    size = 0
    for key,value in pairs(input) do
      size = size + 1
    end
    return size
  else
    size = tostring(input)
    return #size
  end
end
function Fastbots_function.match(...)
  local val = {}
  for no,v in ipairs({...}) do
    val[v] = true
  end
  return val
end
function Fastbots_function.secToClock(seconds)
  local seconds = tonumber(seconds)
  if seconds <= 0 then
    return {hours=00,mins=00,secs=00}
  else
    local hours = string.format("%02.f", math.floor(seconds / 3600));
    local mins = string.format("%02.f", math.floor(seconds / 60 - ( hours*60 ) ));
    local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60));
    return {hours=hours,mins=mins,secs=secs}
  end
end
function Fastbots_function.number_format(num)
  local out = tonumber(num)
  while true do
    out,i= string.gsub(out,'^(-?%d+)(%d%d%d)', '%1,%2')
    if (i==0) then
      break
    end
  end
  return out
end
function Fastbots_function.base64_encode(str)
	local Base ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	return ((str:gsub('.', function(x)
			local r,Base='',x:byte()
			for i=8,1,-1 do r=r..(Base%2^i-Base%2^(i-1)>0 and '1' or '0') end
			return r;
	end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
			if (#x < 6) then return '' end
			local c=0
			for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
			return Base:sub(c+1,c+1)
	end)..({ '', '==', '=' })[#str%3+1])
end
function Fastbots_function.base64_decode(str)
	local Base ='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
  str = string.gsub(str, '[^'..Base..'=]', '')
  return (str:gsub('.', function(x)
    if (x == '=') then
      return ''
    end
    local r,f='',(Base:find(x)-1)
    for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
    return r;
  end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
    if (#x ~= 8) then
      return ''
    end
    local c=0
    for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
    return string.char(c)
  end))
end
function Fastbots_function.exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         return true
      end
   end
   return ok, err
end
function Fastbots_function.in_array(table, value)
  for k,v in pairs(table) do
    if value == v then
      return true
    end
  end
  return false
end
function Fastbots_function.colors(buffer)
  for keys in buffer:gmatch('%%{(.-)}') do
    buffer = string.gsub(buffer,'%%{'..keys..'}', '\27['..Fastbots.colors_key[keys]..'m')
  end
  return buffer .. '\27[0m'
end
function Fastbots_function.add_events(def,filters)
  if type(def) ~= 'function' then
    function_core.print_error('the add_events def must be a function !')
    return {
      Fastbots = false,
    }
    elseif type(filters) ~= 'table' then
      function_core.print_error('the add_events filters must be a table !')
      return {
        Fastbots = false,
      }
    else
      local function_id = #update_functions + 1
      update_functions[function_id] = {}
      update_functions[function_id].def = def
      update_functions[function_id].filters = filters
      return {
        Fastbots = true,
      }
  end
end


function Fastbots_function.set_timer(seconds, def, argv)
  if type(seconds) ~= 'number' then
    return {
      Fastbots = false,
      message = 'set_timer(int seconds, funtion def, table)'
    }
  elseif type(def) ~= 'function' then
    return {
      Fastbots = false,
      message = 'set_timer(int seconds, funtion def, table)'
    }
  end
  Fastbots_timer[#Fastbots_timer + 1] = {
    def = def,
    argv = argv,
    run_in = os.time() + seconds
  }
  return {
    Fastbots = true,
    run_in = os.time() + seconds,
    timer_id = #Fastbots_timer
  }
end
function Fastbots_function.get_timer(timer_id)
  local timer_data = Fastbots_timer[timer_id]
  if timer_data then
    return {
      Fastbots = true,
      run_in = timer_data.run_in,
      argv = timer_data.argv
    }
  else
    return {
      Fastbots = false,
    }
  end
end
function Fastbots_function.cancel_timer(timer_id)
  if Fastbots_timer[timer_id] then
    table.remove(Fastbots_timer,timer_id)
    return {
      Fastbots = true
    }
  else
    return {
      Fastbots = false
    }
  end
end

function Fastbots_function.replyMarkup(input)
  if type(input.type) ~= 'string' then
    return nil
  end
  local _type = string.lower(input.type)
  if _type == 'inline' then
    local result = {
      Fastbots = 'replyMarkupInlineKeyboard',
      rows = {
      }
    }
    for _, rows in pairs(input.data) do
      local new_id = #result.rows + 1
      result.rows[new_id] = {}
      for key, value in pairs(rows) do
        local rows_new_id = #result.rows[new_id] + 1
        if value.url and value.text then
          result.rows[new_id][rows_new_id] = {
            Fastbots = 'inlineKeyboardButton',
            text = value.text,
            type = {
              Fastbots = 'inlineKeyboardButtonTypeUrl',
              url = value.url
            }
          }
        elseif value.data and value.text then
            result.rows[new_id][rows_new_id] = {
              Fastbots = 'inlineKeyboardButton',
              text = value.text,
              type = {
                data = Fastbots_function.base64_encode(value.data), -- Base64 only
                Fastbots = 'inlineKeyboardButtonTypeCallback',
              }
            }
          elseif value.forward_text and value.id and value.url and value.text then
            result.rows[new_id][rows_new_id] = {
              Fastbots = 'inlineKeyboardButton',
              text = value.text,
              type = {
                id = value.id,
                url = value.url,
                forward_text = value.forward_text,
                Fastbots = 'inlineKeyboardButtonTypeLoginUrl',
              }
            }
          elseif value.query and value.text then
            result.rows[new_id][rows_new_id] = {
              Fastbots = 'inlineKeyboardButton',
              text = value.text,
              type = {
                query = value.query,
                Fastbots = 'inlineKeyboardButtonTypeSwitchInline',
              }
            }
        end
      end
    end
    return result
  elseif _type == 'keyboard' then
    local result = {
      Fastbots = 'replyMarkupShowKeyboard',
      resize_keyboard = input.resize,
      one_time = input.one_time,
      is_personal = input.is_personal,
      rows = {
      }
    }
    for _, rows in pairs(input.data) do
      local new_id = #result.rows + 1
      result.rows[new_id] = {}
      for key, value in pairs(rows) do
        local rows_new_id = #result.rows[new_id] + 1
        if type(value.type) == 'string' then
          value.type = string.lower(value.type)
          if value.type == 'requestlocation' and value.text then
            result.rows[new_id][rows_new_id] = {
              type = {
                Fastbots = 'keyboardButtonTypeRequestLocation'
              },
              Fastbots = 'keyboardButton',
              text = value.text
            }
          elseif value.type == 'requestphone' and value.text then
            result.rows[new_id][rows_new_id] = {
              type = {
                Fastbots = 'keyboardButtonTypeRequestPhoneNumber'
              },
              Fastbots = 'keyboardButton',
              text = value.text
            }
          elseif value.type == 'requestpoll' and value.text then
            result.rows[new_id][rows_new_id] = {
              type = {
                Fastbots = 'keyboardButtonTypeRequestPoll',
                force_regular = value.force_regular,
                force_quiz = value.force_quiz
              },
              Fastbots = 'keyboardButton',
              text = value.text
            }
          elseif value.type == 'text' and value.text then
            result.rows[new_id][rows_new_id] = {
              type = {
                Fastbots = 'keyboardButtonTypeText'
              },
              Fastbots = 'keyboardButton',
              text = value.text
            }
          end
        end
      end
    end
    return result
  elseif _type == 'forcereply' then
    return {
      Fastbots = 'replyMarkupForceReply',
      is_personal = input.is_personal
    }
  elseif _type == 'remove' then
    return {
      Fastbots = 'replyMarkupRemoveKeyboard',
      is_personal = input.is_personal
    }
  end
end
function Fastbots_function.addProxy(proxy_type, server, port, username, password_secret, http_only)
  if type(proxy_type) ~= 'string' then
    return {
    Fastbots = false
    }
  end
  local proxy_type = string.lower(proxy_type)
  if proxy_type == 'mtproto' then
    _type_ = {
      Fastbots = 'proxyTypeMtproto',
      secret = password_secret
    }
  elseif proxy_Type == 'socks5' then
    _type_ = {
      Fastbots = 'proxyTypeSocks5',
      username = username,
      password = password_secret
    }
  elseif proxy_Type == 'http' then
    _type_ = {
      Fastbots = 'proxyTypeHttp',
      username = username,
      password = password_secret,
      http_only = http_only
    }
  else
    return {
      Fastbots = false
    }
  end
  return function_core.run_table{
    Fastbots = 'addProxy',
    server = server,
    port = port,
    type = _type_
  }
end
function Fastbots_function.enableProxy(proxy_id)
  return function_core.run_table{
   Fastbots = 'enableProxy',
    proxy_id = proxy_id
  }
end
function Fastbots_function.pingProxy(proxy_id)
  return function_core.run_table{
   Fastbots = 'pingProxy',
    proxy_id = proxy_id
  }
end
function Fastbots_function.disableProxy(proxy_id)
  return function_core.run_table{
   Fastbots = 'disableProxy',
    proxy_id = proxy_id
  }
end
function Fastbots_function.getProxies()
  return function_core.run_table{
    Fastbots = 'getProxies'
  }
end
function Fastbots_function.getChatId(chat_id)
  local chat_id = tostring(chat_id)
  if chat_id:match('^-100') then
    return {
      id = string.sub(chat_id, 5),
      type = 'supergroup'
    }
  else
    local basicgroup_id = string.sub(chat_id, 2)
    return {
      id = string.sub(chat_id, 2),
      type = 'basicgroup'
    }
  end
end
function Fastbots_function.getInputFile(file, conversion_str, expected_size)
  local str = tostring(file)
  if (conversion_str and expectedsize) then
    return {
      Fastbots = 'inputFileGenerated',
      original_path = tostring(file),
      conversion = tostring(conversion_str),
      expected_size = expected_size
    }
  else
    if str:match('^./(.*)$') then
      return {
        Fastbots = 'inputFileLocal',
        path = file
      }
    elseif str:match('^%d+$') then
      return {
        Fastbots = 'inputFileId',
        id = file
      }
    else
      return {
        Fastbots = 'inputFileRemote',
        id = file
      }
    end
  end
end
function Fastbots_function.getParseMode(parse_mode)
  if parse_mode then
    local mode = parse_mode:lower()
    if mode == 'markdown' or mode == 'md' then
      return {
        Fastbots = 'textParseModeMarkdown'
      }
    elseif mode == 'html' or mode == 'lg' then
      return {
        Fastbots = 'textParseModeHTML'
      }
    end
  end
end
function Fastbots_function.parseTextEntities(text, parse_mode)
  if type(parse_mode) == 'string' and string.lower(parse_mode) == 'lg' then
    for txt in text:gmatch('%%{(.-)}') do
      local _text, text_type = txt:match('(.*),(.*)')
      local txt = string.gsub(txt,'+','++')
      local text_type = string.gsub(text_type,' ','')
      if type(_text) == 'string' and type(text_type) == 'string' then
        for key, value in pairs({['<'] = '&lt;',['>'] = '&gt;'}) do
          _text = string.gsub(_text, key, value)
        end
        if (string.lower(text_type) == 'b' or string.lower(text_type) == 'i' or string.lower(text_type) == 'c') then
          local text_type = string.lower(text_type)
          local text_type = text_type == 'c' and 'code' or text_type
          text = string.gsub(text,'%%{'..txt..'}','<'..text_type..'>'.._text..'</'..text_type..'>')
        else
          if type(tonumber(text_type)) == 'number' then
            link = 'tg://user?id='..text_type
          else
            link = text_type
          end
          text = string.gsub(text, '%%{'..txt..'}', '<a href="'..link..'">'.._text..'</a>')
        end
      end
    end
  end
  return function_core.run_table{
    Fastbots = 'parseTextEntities',
    text = tostring(text),
    parse_mode = Fastbots_function.getParseMode(parse_mode)
  }
end
function Fastbots_function.vectorize(table)
  if type(table) == 'table' then
    return table
  else
    return {
      table
    }
  end
end
function Fastbots_function.setLimit(limit, num)
  local limit = tonumber(limit)
  local number = tonumber(num or limit)
  return (number >= limit) and limit or number
end
function Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
  local Fastbots_body, message = {
    Fastbots = 'sendMessage',
    chat_id = chat_id,
    reply_to_message_id = reply_to_message_id or 0,
    disable_notification = disable_notification or 0,
    from_background = from_background or 1,
    reply_markup = reply_markup,
    input_message_content = input_message_content
  }, {}
  if input_message_content.text then
    text = input_message_content.text.text
  elseif input_message_content.caption then
    text = input_message_content.caption.text
  end
  if text then
    if parse_mode then
      local result = Fastbots_function.parseTextEntities(text, parse_mode)
      if Fastbots_body.input_message_content.text then
        Fastbots_body.input_message_content.text = result
      else
        Fastbots_body.input_message_content.caption = result
      end
      return function_core.run_table(Fastbots_body)
    else
      while #text > 4096 do
        text = string.sub(text, 4096, #text)
        message[#message + 1] = text
      end
      message[#message + 1] = text
      for i = 1, #message do
        if input_message_content.text and input_message_content.text.text then
          Fastbots_body.input_message_content.text.text = message[i]
        elseif input_message_content.caption and input_message_content.caption.text then
          Fastbots_body.input_message_content.caption.text = message[i]
        end
        return function_core.run_table(Fastbots_body)
      end
    end
  else
    return function_core.run_table(Fastbots_body)
  end
end
function Fastbots_function.logOut()
  return function_core.run_table{
    Fastbots = 'logOut'
  }
end
function Fastbots_function.getPasswordState()
  return function_core.run_table{
    Fastbots = 'getPasswordState'
  }
end
function Fastbots_function.setPassword(old_password, new_password, new_hint, set_recovery_email_address, new_recovery_email_address)
  return function_core.run_table{
    old_password = tostring(old_password),
    new_password = tostring(new_password),
    new_hint = tostring(new_hint),
    set_recovery_email_address = set_recovery_email_address,
    new_recovery_email_address = tostring(new_recovery_email_address)
  }
end
function Fastbots_function.getRecoveryEmailAddress(password)
  return function_core.run_table{
    Fastbots = 'getRecoveryEmailAddress',
    password = tostring(password)
  }
end
function Fastbots_function.setRecoveryEmailAddress(password, new_recovery_email_address)
  return function_core.run_table{
    Fastbots = 'setRecoveryEmailAddress',
    password = tostring(password),
    new_recovery_email_address = tostring(new_recovery_email_address)
  }
end
function Fastbots_function.requestPasswordRecovery()
  return function_core.run_table{
    Fastbots = 'requestPasswordRecovery'
  }
end
function Fastbots_function.recoverPassword(recovery_code)
  return function_core.run_table{
    Fastbots = 'recoverPassword',
    recovery_code = tostring(recovery_code)
  }
end
function Fastbots_function.createTemporaryPassword(password, valid_for)
  local valid_for = valid_for > 86400 and 86400 or valid_for
  return function_core.run_table{
    Fastbots = 'createTemporaryPassword',
    password = tostring(password),
    valid_for = valid_for
  }
end
function Fastbots_function.getTemporaryPasswordState()
  return function_core.run_table{
    Fastbots = 'getTemporaryPasswordState'
  }
end
function Fastbots_function.getMe()
  return function_core.run_table{
    Fastbots = 'getMe'
  }
end
function Fastbots_function.getUser(user_id)
  return function_core.run_table{
    Fastbots = 'getUser',
    user_id = user_id
  }
end
function Fastbots_function.getUserFullInfo(user_id)
  return function_core.run_table{
    Fastbots = 'getUserFullInfo',
    user_id = user_id
  }
end
function Fastbots_function.getBasicGroup(basic_group_id)
  return function_core.run_table{
    Fastbots = 'getBasicGroup',
    basic_group_id = Fastbots_function.getChatId(basic_group_id).id
  }
end
function Fastbots_function.getBasicGroupFullInfo(basic_group_id)
  return function_core.run_table{
    Fastbots = 'getBasicGroupFullInfo',
    basic_group_id = Fastbots_function.getChatId(basic_group_id).id
  }
end
function Fastbots_function.getSupergroup(supergroup_id)
  return function_core.run_table{
    Fastbots = 'getSupergroup',
    supergroup_id = Fastbots_function.getChatId(supergroup_id).id
  }
end
function Fastbots_function.getSupergroupFullInfo(supergroup_id)
  return function_core.run_table{
    Fastbots = 'getSupergroupFullInfo',
    supergroup_id = Fastbots_function.getChatId(supergroup_id).id
  }
end
function Fastbots_function.getSecretChat(secret_chat_id)
  return function_core.run_table{
    Fastbots = 'getSecretChat',
    secret_chat_id = secret_chat_id
  }
end
function Fastbots_function.getChat(chat_id)
  return function_core.run_table{
    Fastbots = 'getChat',
    chat_id = chat_id
  }
end
function Fastbots_function.getMessage(chat_id, message_id)
  return function_core.run_table{
    Fastbots = 'getMessage',
    chat_id = chat_id,
    message_id = message_id
  }
end
function Fastbots_function.getRepliedMessage(chat_id, message_id)
  return function_core.run_table{
    Fastbots = 'getRepliedMessage',
    chat_id = chat_id,
    message_id = message_id
  }
end
function Fastbots_function.getChatPinnedMessage(chat_id)
  return function_core.run_table{
    Fastbots = 'getChatPinnedMessage',
    chat_id = chat_id
  }
end
function Fastbots_function.unpinAllChatMessages(chat_id)
  return function_core.run_table{
    Fastbots = 'unpinAllChatMessages',
    chat_id = chat_id
  }
end
function Fastbots_function.getMessages(chat_id, message_ids)
  return function_core.run_table{
    Fastbots = 'getMessages',
    chat_id = chat_id,
    message_ids = Fastbots_function.vectorize(message_ids)
  }
end
function Fastbots_function.getFile(file_id)
  return function_core.run_table{
    Fastbots = 'getFile',
    file_id = file_id
  }
end
function Fastbots_function.getRemoteFile(remote_file_id, file_type)
  return function_core.run_table{
    Fastbots = 'getRemoteFile',
    remote_file_id = tostring(remote_file_id),
    file_type = {
      Fastbots = 'fileType' .. file_type or 'Unknown'
    }
  }
end
function Fastbots_function.getChats(chat_list, offset_order, offset_chat_id, limit)
  local limit = limit or 20
  local offset_order = offset_order or '9223372036854775807'
  local offset_chat_id = offset_chat_id or 0
  local filter = (string.lower(tostring(chat_list)) == 'archive') and 'chatListArchive' or 'chatListMain'
  return function_core.run_table{
    Fastbots = 'getChats',
    offset_order = offset_order,
    offset_chat_id = offset_chat_id,
    limit = Fastbots_function.setLimit(100, limit),
    chat_list = {
      Fastbots = filter
    }
  }
end
function Fastbots_function.searchPublicChat(username)
  return function_core.run_table{
    Fastbots = 'searchPublicChat',
    username = tostring(username)
  }
end
function Fastbots_function.searchPublicChats(query)
  return function_core.run_table{
    Fastbots = 'searchPublicChats',
    query = tostring(query)
  }
end
function Fastbots_function.searchChats(query, limit)
  return function_core.run_table{
    Fastbots = 'searchChats',
    query = tostring(query),
    limit = limit
  }
end
function Fastbots_function.checkChatUsername(chat_id, username)
  return function_core.run_table{
    Fastbots = 'checkChatUsername',
    chat_id = chat_id,
    username = tostring(username)
  }
end
function Fastbots_function.searchChatsOnServer(query, limit)
  return function_core.run_table{
    Fastbots = 'searchChatsOnServer',
    query = tostring(query),
    limit = limit
  }
end
function Fastbots_function.clearRecentlyFoundChats()
  return function_core.run_table{
    Fastbots = 'clearRecentlyFoundChats'
  }
end
function Fastbots_function.getTopChats(category, limit)
  return function_core.run_table{
    Fastbots = 'getTopChats',
    category = {
      Fastbots = 'topChatCategory' .. category
    },
    limit = Fastbots_function.setLimit(30, limit)
  }
end
function Fastbots_function.removeTopChat(category, chat_id)
  return function_core.run_table{
    Fastbots = 'removeTopChat',
    category = {
      Fastbots = 'topChatCategory' .. category
    },
    chat_id = chat_id
  }
end
function Fastbots_function.addRecentlyFoundChat(chat_id)
  return function_core.run_table{
    Fastbots = 'addRecentlyFoundChat',
    chat_id = chat_id
  }
end
function Fastbots_function.getCreatedPublicChats()
  return function_core.run_table{
    Fastbots = 'getCreatedPublicChats'
  }
end
function Fastbots_function.removeRecentlyFoundChat(chat_id)
  return function_core.run_table{
    Fastbots = 'removeRecentlyFoundChat',
    chat_id = chat_id
  }
end
function Fastbots_function.getChatHistory(chat_id, from_message_id, offset, limit, only_local)
  return function_core.run_table{
    Fastbots = 'getChatHistory',
    chat_id = chat_id,
    from_message_id = from_message_id,
    offset = offset,
    limit = Fastbots_function.setLimit(100, limit),
    only_local = only_local
  }
end
function Fastbots_function.getGroupsInCommon(user_id, offset_chat_id, limit)
  return function_core.run_table{
    Fastbots = 'getGroupsInCommon',
    user_id = user_id,
    offset_chat_id = offset_chat_id or 0,
    limit = Fastbots_function.setLimit(100, limit)
  }
end
function Fastbots_function.searchMessages(query, offset_date, offset_chat_id, offset_message_id, limit)
  return function_core.run_table{
    Fastbots = 'searchMessages',
    query = tostring(query),
    offset_date = offset_date or 0,
    offset_chat_id = offset_chat_id or 0,
    offset_message_id = offset_message_id or 0,
    limit = Fastbots_function.setLimit(100, limit)
  }
end
function Fastbots_function.searchChatMessages(chat_id, query, filter, sender_user_id, from_message_id, offset, limit)
  return function_core.run_table{
    Fastbots = 'searchChatMessages',
    chat_id = chat_id,
    query = tostring(query),
    sender_user_id = sender_user_id or 0,
    from_message_id = from_message_id or 0,
    offset = offset or 0,
    limit = Fastbots_function.setLimit(100, limit),
    filter = {
      Fastbots = 'searchMessagesFilter' .. filter
    }
  }
end
function Fastbots_function.searchSecretMessages(chat_id, query, from_search_id, limit, filter)
  local filter = filter or 'Empty'
  return function_core.run_table{
    Fastbots = 'searchSecretMessages',
    chat_id = chat_id or 0,
    query = tostring(query),
    from_search_id = from_search_id or 0,
    limit = Fastbots_function.setLimit(100, limit),
    filter = {
      Fastbots = 'searchMessagesFilter' .. filter
    }
  }
end
function Fastbots_function.deleteChatHistory(chat_id, remove_from_chat_list)
  return function_core.run_table{
    Fastbots = 'deleteChatHistory',
    chat_id = chat_id,
    remove_from_chat_list = remove_from_chat_list
  }
end
function Fastbots_function.searchCallMessages(from_message_id, limit, only_missed)
  return function_core.run_table{
    Fastbots = 'searchCallMessages',
    from_message_id = from_message_id or 0,
    limit = Fastbots_function.setLimit(100, limit),
    only_missed = only_missed
  }
end
function Fastbots_function.getChatMessageByDate(chat_id, date)
  return function_core.run_table{
    Fastbots = 'getChatMessageByDate',
    chat_id = chat_id,
    date = date
  }
end
function Fastbots_function.getPublicMessageLink(chat_id, message_id, for_album)
  return function_core.run_table{
    Fastbots = 'getPublicMessageLink',
    chat_id = chat_id,
    message_id = message_id,
    for_album = for_album
  }
end
function Fastbots_function.sendMessageAlbum(chat_id, reply_to_message_id, input_message_contents, disable_notification, from_background)
  return function_core.run_table{
    Fastbots = 'sendMessageAlbum',
    chat_id = chat_id,
    reply_to_message_id = reply_to_message_id or 0,
    disable_notification = disable_notification,
    from_background = from_background,
    input_message_contents = Fastbots_function.vectorize(input_message_contents)
  }
end
function Fastbots_function.sendBotStartMessage(bot_user_id, chat_id, parameter)
  return function_core.run_table{
    Fastbots = 'sendBotStartMessage',
    bot_user_id = bot_user_id,
    chat_id = chat_id,
    parameter = tostring(parameter)
  }
end
function Fastbots_function.sendInlineQueryResultMessage(chat_id, reply_to_message_id, disable_notification, from_background, query_id, result_id)
  return function_core.run_table{
    Fastbots = 'sendInlineQueryResultMessage',
    chat_id = chat_id,
    reply_to_message_id = reply_to_message_id,
    disable_notification = disable_notification,
    from_background = from_background,
    query_id = query_id,
    result_id = tostring(result_id)
  }
end
function Fastbots_function.forwardMessages(chat_id, from_chat_id, message_ids, disable_notification, from_background, as_album, send_copy, remove_caption)
  return function_core.run_table{
    Fastbots = 'forwardMessages',
    chat_id = chat_id,
    from_chat_id = from_chat_id,
    message_ids = Fastbots_function.vectorize(message_ids),
    disable_notification = disable_notification,
    from_background = from_background,
    as_album = as_album,
    send_copy = send_copy,
    remove_caption = remove_caption
  }
end
function Fastbots_function.sendChatSetTtlMessage(chat_id, ttl)
  return function_core.run_table{
    Fastbots = 'sendChatSetTtlMessage',
    chat_id = chat_id,
    ttl = ttl
  }
end
function Fastbots_function.sendChatScreenshotTakenNotification(chat_id)
  return function_core.run_table{
    Fastbots = 'sendChatScreenshotTakenNotification',
    chat_id = chat_id
  }
end
function Fastbots_function.deleteMessages(chat_id, message_ids, revoke)
  return function_core.run_table{
    Fastbots = 'deleteMessages',
    chat_id = chat_id,
    message_ids = Fastbots_function.vectorize(message_ids),
    revoke = revoke
  }
end
function Fastbots_function.deleteChatMessagesFromUser(chat_id, user_id)
  return function_core.run_table{
    Fastbots = 'deleteChatMessagesFromUser',
    chat_id = chat_id,
    user_id = user_id
  }
end
function Fastbots_function.editMessageText(chat_id, message_id, text, parse_mode, disable_web_page_preview, clear_draft, reply_markup)
  local Fastbots_body = {
    Fastbots = 'editMessageText',
    chat_id = chat_id,
    message_id = message_id,
    reply_markup = reply_markup,
    input_message_content = {
      Fastbots = 'inputMessageText',
      disable_web_page_preview = disable_web_page_preview,
      text = {
        text = text
      },
      clear_draft = clear_draft
    }
  }
  if parse_mode then
    Fastbots_body.input_message_content.text = Fastbots_function.parseTextEntities(text, parse_mode)
  end
  return function_core.run_table(Fastbots_body)
end
function Fastbots_function.editMessageCaption(chat_id, message_id, caption, parse_mode, reply_markup)
  local Fastbots_body = {
    Fastbots = 'editMessageCaption',
    chat_id = chat_id,
    message_id = message_id,
    reply_markup = reply_markup,
    caption = tostring(caption)
  }
  if parse_mode then
      Fastbots_body.caption = Fastbots_function.parseTextEntities(text,parse_mode)
  end
  return function_core.run_table(Fastbots_body)
end
function Fastbots_function.getTextEntities(text)
  return function_core.run_table{
    Fastbots = 'getTextEntities',
    text = tostring(text)
  }
end
function Fastbots_function.getFileMimeType(file_name)
  return function_core.run_table{
    Fastbots = 'getFileMimeType',
    file_name = tostring(file_name)
  }
end
function Fastbots_function.getFileExtension(mime_type)
  return function_core.run_table{
    Fastbots = 'getFileExtension',
    mime_type = tostring(mime_type)
  }
end
function Fastbots_function.getInlineQueryResults(bot_user_id, chat_id, latitude, longitude, query, offset)
  return function_core.run_table{
    Fastbots = 'getInlineQueryResults',
    bot_user_id = bot_user_id,
    chat_id = chat_id,
    user_location = {
      Fastbots = 'location',
      latitude = latitude,
      longitude = longitude
    },
    query = tostring(query),
    offset = tostring(offset)
  }
end
function Fastbots_function.answerCallbackQuery(callback_query_id, text, show_alert, url, cache_time)
  return function_core.run_table{
        Fastbots = 'answerCallbackQuery',
        callback_query_id = callback_query_id,
        show_alert = show_alert,
        cache_time = cache_time,
        text = text,
        url = url,
  }
end
function Fastbots_function.getCallbackQueryAnswer(chat_id, message_id, payload, data, game_short_name)
  return function_core.run_table{
    Fastbots = 'getCallbackQueryAnswer',
    chat_id = chat_id,
    message_id = message_id,
    payload = {
      Fastbots = 'callbackQueryPayload' .. payload,
      data = data,
      game_short_name = game_short_name
    }
  }
end
function Fastbots_function.deleteChatReplyMarkup(chat_id, message_id)
  return function_core.run_table{
    Fastbots = 'deleteChatReplyMarkup',
    chat_id = chat_id,
    message_id = message_id
  }
end
function Fastbots_function.sendChatAction(chat_id, action, progress)
  return function_core.run_table{
    Fastbots = 'sendChatAction',
    chat_id = chat_id,
    action = {
      Fastbots = 'chatAction' .. action,
      progress = progress or 100
    }
  }
end
function Fastbots_function.openChat(chat_id)
  return function_core.run_table{
    Fastbots = 'openChat',
    chat_id = chat_id
  }
end
function Fastbots_function.closeChat(chat_id)
  return function_core.run_table{
    Fastbots = 'closeChat',
    chat_id = chat_id
  }
end
function Fastbots_function.viewMessages(chat_id, message_ids, force_read)
  return function_core.run_table{
    Fastbots = 'viewMessages',
    chat_id = chat_id,
    message_ids = Fastbots_function.vectorize(message_ids),
    force_read = force_read
  }
end
function Fastbots_function.openMessageContent(chat_id, message_id)
  return function_core.run_table{
    Fastbots = 'openMessageContent',
    chat_id = chat_id,
    message_id = message_id
  }
end
function Fastbots_function.readAllChatMentions(chat_id)
  return function_core.run_table{
    Fastbots = 'readAllChatMentions',
    chat_id = chat_id
  }
end
function Fastbots_function.createPrivateChat(user_id, force)
  return function_core.run_table{
    Fastbots = 'createPrivateChat',
    user_id = user_id,
    force = force
  }
end
function Fastbots_function.createBasicGroupChat(basic_group_id, force)
  return function_core.run_table{
    Fastbots = 'createBasicGroupChat',
    basic_group_id = Fastbots_function.getChatId(basic_group_id).id,
    force = force
  }
end
function Fastbots_function.createSupergroupChat(supergroup_id, force)
  return function_core.run_table{
    Fastbots = 'createSupergroupChat',
    supergroup_id = Fastbots_function.getChatId(supergroup_id).id,
    force = force
  }
end
function Fastbots_function.createSecretChat(secret_chat_id)
  return function_core.run_table{
    Fastbots = 'createSecretChat',
    secret_chat_id = secret_chat_id
  }
end
function Fastbots_function.createNewBasicGroupChat(user_ids, title)
  return function_core.run_table{
    Fastbots = 'createNewBasicGroupChat',
    user_ids = Fastbots_function.vectorize(user_ids),
    title = tostring(title)
  }
end
function Fastbots_function.createNewSupergroupChat(title, is_channel, description)
  return function_core.run_table{
    Fastbots = 'createNewSupergroupChat',
    title = tostring(title),
    is_channel = is_channel,
    description = tostring(description)
  }
end
function Fastbots_function.createNewSecretChat(user_id)
  return function_core.run_table{
    Fastbots = 'createNewSecretChat',
    user_id = tonumber(user_id)
  }
end
function Fastbots_function.upgradeBasicGroupChatToSupergroupChat(chat_id)
  return function_core.run_table{
    Fastbots = 'upgradeBasicGroupChatToSupergroupChat',
    chat_id = chat_id
  }
end
function Fastbots_function.setChatPermissions(chat_id, can_send_messages, can_send_media_messages, can_send_polls, can_send_other_messages, can_add_web_page_previews, can_change_info, can_invite_users, can_pin_messages)
  return function_core.run_table{
    Fastbots = 'setChatPermissions',
    chat_id = chat_id,
     permissions = {
      can_send_messages = can_send_messages,
      can_send_media_messages = can_send_media_messages,
      can_send_polls = can_send_polls,
      can_send_other_messages = can_send_other_messages,
      can_add_web_page_previews = can_add_web_page_previews,
      can_change_info = can_change_info,
      can_invite_users = can_invite_users,
      can_pin_messages = can_pin_messages,
    }
  }
end
function Fastbots_function.setChatTitle(chat_id, title)
  return function_core.run_table{
    Fastbots = 'setChatTitle',
    chat_id = chat_id,
    title = tostring(title)
  }
end
function Fastbots_function.setChatPhoto(chat_id, photo)
  return function_core.run_table{
    Fastbots = 'setChatPhoto',
    chat_id = chat_id,
    photo = {Fastbots = 'inputChatPhotoStatic', photo = Fastbots_function.getInputFile(photo)}
  }
end 
function Fastbots_function.setChatDraftMessage(chat_id, reply_to_message_id, text, parse_mode, disable_web_page_preview, clear_draft)
  local Fastbots_body = {
    Fastbots = 'setChatDraftMessage',
    chat_id = chat_id,
    draft_message = {
      Fastbots = 'draftMessage',
      reply_to_message_id = reply_to_message_id,
      input_message_text = {
        Fastbots = 'inputMessageText',
        disable_web_page_preview = disable_web_page_preview,
        text = {text = text},
        clear_draft = clear_draft
      }
    }
  }
  if parse_mode then
      Fastbots_body.draft_message.input_message_text.text = Fastbots_function.parseTextEntities(text, parse_mode)
  end
  return function_core.run_table(Fastbots_body)
end
function Fastbots_function.toggleChatIsPinned(chat_id, is_pinned)
  return function_core.run_table{
    Fastbots = 'toggleChatIsPinned',
    chat_id = chat_id,
    is_pinned = is_pinned
  }
end
function Fastbots_function.setChatClientData(chat_id, client_data)
  return function_core.run_table{
    Fastbots = 'setChatClientData',
    chat_id = chat_id,
    client_data = tostring(client_data)
  }
end
function Fastbots_function.addChatMember(chat_id, user_id, forward_limit)
  return function_core.run_table{
    Fastbots = 'addChatMember',
    chat_id = chat_id,
    user_id = user_id,
    forward_limit = Fastbots_function.setLimit(300, forward_limit)
  }
end
function Fastbots_function.addChatMembers(chat_id, user_ids)
  return function_core.run_table{
    Fastbots = 'addChatMembers',
    chat_id = chat_id,
    user_ids = Fastbots_function.vectorize(user_ids)
  }
end
function Fastbots_function.setChatMemberStatus(chat_id, user_id, status, right)
  local right = right and Fastbots_function.vectorize(right) or {}
  local status = string.lower(status)
  if status == 'creator' then
    chat_member_status = {
      Fastbots = 'chatMemberStatusCreator',
      is_member = right[1] or 1
    }
  elseif status == 'administrator' then
    chat_member_status = {
      Fastbots = 'chatMemberStatusAdministrator',
      can_be_edited = right[1] or 1,
      can_change_info = right[2] or 0,
      can_post_messages = right[3] or 1,
      can_edit_messages = right[4] or 1,
      can_delete_messages = right[5] or 0,
      can_invite_users = right[6] or 1,
      can_restrict_members = right[7] or 0,
      can_pin_messages = right[8] or 0,
      can_manage_video_chats = right[9] or 0,
      is_anonymous = right[10] or 0,
      can_manage_chat = right[11] or 0,
      can_promote_members = right[12] or 0,
      custom_title = tostring(right[13]) or ''
    }
  elseif status == 'restricted' then
    chat_member_status = {
      permissions = {
        Fastbots = 'chatPermissions',
        can_send_polls = right[2] or 0,
        can_add_web_page_previews = right[3] or 1,
        can_change_info = right[4] or 0,
        can_invite_users = right[5] or 1,
        can_pin_messages = right[6] or 0,
        can_send_media_messages = right[7] or 1,
        can_send_messages = right[8] or 1,
        can_send_other_messages = right[9] or 1
      },
      is_member = right[1] or 1,
      restricted_until_date = right[10] or 0,
      Fastbots = 'chatMemberStatusRestricted'
    }
  elseif status == 'banned' then
    chat_member_status = {
      Fastbots = 'chatMemberStatusBanned',
      banned_until_date = right[1] or 0
    }
  end
  return function_core.run_table{
    Fastbots = 'setChatMemberStatus',
    chat_id = chat_id,
    member_id = {_='messageSenderUser', user_id = user_id},
    status = chat_member_status or {}
  }
end
function Fastbots_function.SetAdmin(chat_id, user_id,right)
chat_member_status = {
      Fastbots = 'chatMemberStatusAdministrator',
      can_be_edited = right[1] or 1,
      can_change_info = right[2] or 1,
      can_post_messages = right[3] or 1,
      can_edit_messages = right[4] or 1,
      can_delete_messages = right[5] or 1,
      can_invite_users = right[6] or 1,
      can_restrict_members = right[7] or 1,
      can_pin_messages = right[8] or 1,
      can_manage_video_chats = right[9] or 1,
      is_anonymous = right[10] or 1,
      can_manage_chat = right[11] or 1,
      can_promote_members = right[12] or 0,
      custom_title = tostring(right[13]) or ''
    }
return function_core.run_table{
    Fastbots = 'setChatMemberStatus',
    chat_id = chat_id,
    member_id = {_='messageSenderUser', user_id = user_id},
    status = chat_member_status or {}
  }
end

function Fastbots_function.getChatMember(chat_id, user_id)
  return function_core.run_table{
    Fastbots = 'getChatMember',
    chat_id = chat_id,
    member_id = {_='messageSenderUser', user_id = user_id}
  }
end 
function Fastbots_function.searchChatMembers(chat_id, query, limit)
  return function_core.run_table{
    Fastbots = 'searchChatMembers',
    chat_id = chat_id,
    query = tostring(query),
    limit = Fastbots_function.setLimit(400, limit)
  }
end
function Fastbots_function.getChatAdministrators(chat_id)
  return function_core.run_table{
    Fastbots = 'getChatAdministrators',
    chat_id = chat_id
  }
end
function Fastbots_function.setPinnedChats(chat_ids)
  return function_core.run_table{
    Fastbots = 'setPinnedChats',
    chat_ids = Fastbots_function.vectorize(chat_ids)
  }
end
function Fastbots_function.downloadFile(file_id, priority)
  return function_core.run_table{
    Fastbots = 'downloadFile',
    file_id = file_id,
    priority = priority or 32
  }
end
function Fastbots_function.cancelDownloadFile(file_id, only_if_pending)
  return function_core.run_table{
    Fastbots = 'cancelDownloadFile',
    file_id = file_id,
    only_if_pending = only_if_pending
  }
end
function Fastbots_function.uploadFile(file, file_type, priority)
  local ftype = file_type or 'Unknown'
  return function_core.run_table{
    Fastbots = 'uploadFile',
    file = Fastbots_function.getInputFile(file),
    file_type = {
      Fastbots = 'fileType' .. ftype
    },
    priority = priority or 32
  }
end
function Fastbots_function.cancelUploadFile(file_id)
  return function_core.run_table{
    Fastbots = 'cancelUploadFile',
    file_id = file_id
  }
end
function Fastbots_function.deleteFile(file_id)
  return function_core.run_table{
    Fastbots = 'deleteFile',
    file_id = file_id
  }
end
function Fastbots_function.generateChatInviteLink(chat_id,name,expire_date,member_limit,creates_join_request)
  return function_core.run_table{
    Fastbots = 'createChatInviteLink',
    chat_id = chat_id,
    name = tostring(name),
    expire_date = tonumber(expire_date),
    member_limit = tonumber(member_limit),
    creates_join_request = creates_join_request
  }
end 
function Fastbots_function.joinChatByUsernam(username)
  if type(username) == 'string' and 5 <= #username then
    local result = Fastbots_function.searchPublicChat(username)
    if result.type and result.type.Fastbots == 'chatTypeSupergroup' then
      return function_core.run_table{
        Fastbots = 'joinChat',
        chat_id = result.id
      }
    else
      return result
    end
  end
end
function Fastbots_function.checkChatInviteLink(invite_link)
  return function_core.run_table{
    Fastbots = 'checkChatInviteLink',
    invite_link = tostring(invite_link)
  }
end
function Fastbots_function.joinChatByInviteLink(invite_link)
  return function_core.run_table{
    Fastbots = 'joinChatByInviteLink',
    invite_link = tostring(invite_link)
  }
end
function Fastbots_function.leaveChat(chat_id)
  return  function_core.run_table{
    Fastbots = 'leaveChat',
    chat_id = chat_id
  }
end
function Fastbots_function.createCall(user_id, udp_p2p, udp_reflector, min_layer, max_layer)
  return function_core.run_table{
    Fastbots = 'createCall',
    user_id = user_id,
    protocol = {
      Fastbots = 'callProtocol',
      udp_p2p = udp_p2p,
      udp_reflector = udp_reflector,
      min_layer = min_layer or 65,
      max_layer = max_layer or 65
    }
  }
end
function Fastbots_function.acceptCall(call_id, udp_p2p, udp_reflector, min_layer, max_layer)
  return function_core.run_table{
    Fastbots = 'acceptCall',
    call_id = call_id,
    protocol = {
      Fastbots = 'callProtocol',
      udp_p2p = udp_p2p,
      udp_reflector = udp_reflector,
      min_layer = min_layer or 65,
      max_layer = max_layer or 65
    }
  }
end
function Fastbots_function.blockUser(user_id)
  return function_core.run_table{
    Fastbots = 'blockUser',
    user_id = user_id
  }
end
function Fastbots_function.unblockUser(user_id)
  return function_core.run_table{
    Fastbots = 'unblockUser',
    user_id = user_id
  }
end
function Fastbots_function.getBlockedUsers(offset, limit)
  return function_core.run_table{
    Fastbots = 'getBlockedUsers',
    offset = offset or 0,
    limit = Fastbots_function.setLimit(100, limit)
  }
end
function Fastbots_function.getContacts()
  return function_core.run_table{
    Fastbots = 'getContacts'
  }
end
function Fastbots_function.importContacts(contacts)
  local result = {}
  for key, value in pairs(contacts) do
    result[#result + 1] = {
      Fastbots = 'contact',
      phone_number = tostring(value.phone_number),
      first_name = tostring(value.first_name),
      last_name = tostring(value.last_name),
      user_id = value.user_id or 0
    }
  end
  return function_core.run_table{
    Fastbots = 'importContacts',
    contacts = result
  }
end
function Fastbots_function.searchContacts(query, limit)
  return function_core.run_table{
    Fastbots = 'searchContacts',
    query = tostring(query),
    limit = limit
  }
end
function Fastbots_function.removeContacts(user_ids)
  return function_core.run_table{
    Fastbots = 'removeContacts',
    user_ids = Fastbots_function.vectorize(user_ids)
  }
end
function Fastbots_function.getImportedContactCount()
  return function_core.run_table{
    Fastbots = 'getImportedContactCount'
  }
end
function Fastbots_function.changeImportedContacts(phone_number, first_name, last_name, user_id)
  return function_core.run_table{
    Fastbots = 'changeImportedContacts',
    contacts = {
      Fastbots = 'contact',
      phone_number = tostring(phone_number),
      first_name = tostring(first_name),
      last_name = tostring(last_name),
      user_id = user_id or 0
    }
  }
end
function Fastbots_function.clearImportedContacts()
  return function_core.run_table{
    Fastbots = 'clearImportedContacts'
  }
end
function Fastbots_function.getUserProfilePhotos(user_id, offset, limit)
  return function_core.run_table{
    Fastbots = 'getUserProfilePhotos',
    user_id = user_id,
    offset = offset or 0,
    limit = Fastbots_function.setLimit(100, limit)
  }
end
function Fastbots_function.getStickers(emoji, limit)
  return function_core.run_table{
    Fastbots = 'getStickers',
    emoji = tostring(emoji),
    limit = Fastbots_function.setLimit(100, limit)
  }
end
function Fastbots_function.searchStickers(emoji, limit)
  return function_core.run_table{
    Fastbots = 'searchStickers',
    emoji = tostring(emoji),
    limit = limit
  }
end
function Fastbots_function.getArchivedStickerSets(is_masks, offset_sticker_set_id, limit)
  return function_core.run_table{
    Fastbots = 'getArchivedStickerSets',
    is_masks = is_masks,
    offset_sticker_set_id = offset_sticker_set_id,
    limit = limit
  }
end
function Fastbots_function.getTrendingStickerSets()
  return function_core.run_table{
    Fastbots = 'getTrendingStickerSets'
  }
end
function Fastbots_function.getAttachedStickerSets(file_id)
  return function_core.run_table{
    Fastbots = 'getAttachedStickerSets',
    file_id = file_id
  }
end
function Fastbots_function.getStickerSet(set_id)
  return function_core.run_table{
    Fastbots = 'getStickerSet',
    set_id = set_id
  }
end
function Fastbots_function.searchStickerSet(name)
  return function_core.run_table{
    Fastbots = 'searchStickerSet',
    name = tostring(name)
  }
end
function Fastbots_function.searchInstalledStickerSets(is_masks, query, limit)
  return function_core.run_table{
    Fastbots = 'searchInstalledStickerSets',
    is_masks = is_masks,
    query = tostring(query),
    limit = limit
  }
end
function Fastbots_function.searchStickerSets(query)
  return function_core.run_table{
    Fastbots = 'searchStickerSets',
    query = tostring(query)
  }
end
function Fastbots_function.changeStickerSet(set_id, is_installed, is_archived)
  return function_core.run_table{
    Fastbots = 'changeStickerSet',
    set_id = set_id,
    is_installed = is_installed,
    is_archived = is_archived
  }
end
function Fastbots_function.viewTrendingStickerSets(sticker_set_ids)
  return function_core.run_table{
    Fastbots = 'viewTrendingStickerSets',
    sticker_set_ids = Fastbots_function.vectorize(sticker_set_ids)
  }
end
function Fastbots_function.reorderInstalledStickerSets(is_masks, sticker_set_ids)
  return function_core.run_table{
    Fastbots = 'reorderInstalledStickerSets',
    is_masks = is_masks,
    sticker_set_ids = Fastbots_function.vectorize(sticker_set_ids)
  }
end
function Fastbots_function.getRecentStickers(is_attached)
  return function_core.run_table{
    Fastbots = 'getRecentStickers',
    is_attached = is_attached
  }
end
function Fastbots_function.addRecentSticker(is_attached, sticker)
  return function_core.run_table{
    Fastbots = 'addRecentSticker',
    is_attached = is_attached,
    sticker = Fastbots_function.getInputFile(sticker)
  }
end
function Fastbots_function.clearRecentStickers(is_attached)
  return function_core.run_table{
    Fastbots = 'clearRecentStickers',
    is_attached = is_attached
  }
end
function Fastbots_function.getFavoriteStickers()
  return function_core.run_table{
    Fastbots = 'getFavoriteStickers'
  }
end
function Fastbots_function.addFavoriteSticker(sticker)
  return function_core.run_table{
    Fastbots = 'addFavoriteSticker',
    sticker = Fastbots_function.getInputFile(sticker)
  }
end
function Fastbots_function.removeFavoriteSticker(sticker)
  return function_core.run_table{
    Fastbots = 'removeFavoriteSticker',
    sticker = Fastbots_function.getInputFile(sticker)
  }
end
function Fastbots_function.getStickerEmojis(sticker)
  return function_core.run_table{
    Fastbots = 'getStickerEmojis',
    sticker = Fastbots_function.getInputFile(sticker)
  }
end
function Fastbots_function.getSavedAnimations()
  return function_core.run_table{
    Fastbots = 'getSavedAnimations'
  }
end
function Fastbots_function.addSavedAnimation(animation)
  return function_core.run_table{
    Fastbots = 'addSavedAnimation',
    animation = Fastbots_function.getInputFile(animation)
  }
end
function Fastbots_function.removeSavedAnimation(animation)
  return function_core.run_table{
    Fastbots = 'removeSavedAnimation',
    animation = Fastbots_function.getInputFile(animation)
  }
end
function Fastbots_function.getRecentInlineBots()
  return function_core.run_table{
    Fastbots = 'getRecentInlineBots'
  }
end
function Fastbots_function.searchHashtags(prefix, limit)
  return function_core.run_table{
    Fastbots = 'searchHashtags',
    prefix = tostring(prefix),
    limit = limit
  }
end
function Fastbots_function.removeRecentHashtag(hashtag)
  return function_core.run_table{
    Fastbots = 'removeRecentHashtag',
    hashtag = tostring(hashtag)
  }
end
function Fastbots_function.getWebPagePreview(text)
  return function_core.run_table{
    Fastbots = 'getWebPagePreview',
    text = {
      text = text
    }
  }
end
function Fastbots_function.getWebPageInstantView(url, force_full)
  return function_core.run_table{
    Fastbots = 'getWebPageInstantView',
    url = tostring(url),
    force_full = force_full
  }
end
function Fastbots_function.getNotificationSettings(scope, chat_id)
  return function_core.run_table{
    Fastbots = 'getNotificationSettings',
    scope = {
      Fastbots = 'notificationSettingsScope' .. scope,
      chat_id = chat_id
    }
  }
end
function Fastbots_function.setNotificationSettings(scope, chat_id, mute_for, sound, show_preview)
  return function_core.run_table{
    Fastbots = 'setNotificationSettings',
    scope = {
      Fastbots = 'notificationSettingsScope' .. scope,
      chat_id = chat_id
    },
    notification_settings = {
      Fastbots = 'notificationSettings',
      mute_for = mute_for,
      sound = tostring(sound),
      show_preview = show_preview
    }
  }
end
function Fastbots_function.resetAllNotificationSettings()
  return function_core.run_table{
    Fastbots = 'resetAllNotificationSettings'
  }
end
function Fastbots_function.setProfilePhoto(photo)
  return function_core.run_table{
    Fastbots = 'setProfilePhoto',
    photo = Fastbots_function.getInputFile(photo)
  }
end
function Fastbots_function.deleteProfilePhoto(profile_photo_id)
  return function_core.run_table{
    Fastbots = 'deleteProfilePhoto',
    profile_photo_id = profile_photo_id
  }
end
function Fastbots_function.setName(first_name, last_name)
  return function_core.run_table{
    Fastbots = 'setName',
    first_name = tostring(first_name),
    last_name = tostring(last_name)
  }
end
function Fastbots_function.setBio(bio)
  return function_core.run_table{
    Fastbots = 'setBio',
    bio = tostring(bio)
  }
end
function Fastbots_function.setUsername(username)
  return function_core.run_table{
    Fastbots = 'setUsername',
    username = tostring(username)
  }
end
function Fastbots_function.getActiveSessions()
  return function_core.run_table{
    Fastbots = 'getActiveSessions'
  }
end
function Fastbots_function.terminateAllOtherSessions()
  return function_core.run_table{
    Fastbots = 'terminateAllOtherSessions'
  }
end
function Fastbots_function.terminateSession(session_id)
  return function_core.run_table{
    Fastbots = 'terminateSession',
    session_id = session_id
  }
end
function Fastbots_function.toggleBasicGroupAdministrators(basic_group_id, everyone_is_administrator)
  return function_core.run_table{
    Fastbots = 'toggleBasicGroupAdministrators',
    basic_group_id = Fastbots_function.getChatId(basic_group_id).id,
    everyone_is_administrator = everyone_is_administrator
  }
end
function Fastbots_function.setSupergroupUsername(supergroup_id, username)
  return function_core.run_table{
    Fastbots = 'setSupergroupUsername',
    supergroup_id = Fastbots_function.getChatId(supergroup_id).id,
    username = tostring(username)
  }
end
function Fastbots_function.setSupergroupStickerSet(supergroup_id, sticker_set_id)
  return function_core.run_table{
    Fastbots = 'setSupergroupStickerSet',
    supergroup_id = Fastbots_function.getChatId(supergroup_id).id,
    sticker_set_id = sticker_set_id
  }
end
function Fastbots_function.toggleSupergroupInvites(supergroup_id, anyone_can_invite)
  return function_core.run_table{
    Fastbots = 'toggleSupergroupInvites',
    supergroup_id = Fastbots_function.getChatId(supergroup_id).id,
    anyone_can_invite = anyone_can_invite
  }
end
function Fastbots_function.toggleSupergroupSignMessages(supergroup_id, sign_messages)
  return function_core.run_table{
    Fastbots = 'toggleSupergroupSignMessages',
    supergroup_id = Fastbots_function.getChatId(supergroup_id).id,
    sign_messages = sign_messages
  }
end
function Fastbots_function.toggleSupergroupIsAllHistoryAvailable(supergroup_id, is_all_history_available)
  return function_core.run_table{
    Fastbots = 'toggleSupergroupIsAllHistoryAvailable',
    supergroup_id = Fastbots_function.getChatId(supergroup_id).id,
    is_all_history_available = is_all_history_available
  }
end
function Fastbots_function.setChatDescription(chat_id, description)
  return function_core.run_table{
    Fastbots = 'setChatDescription',
    chat_id = chat_id,
    description = tostring(description)
  }
end
function Fastbots_function.pinChatMessage(chat_id, message_id, disable_notification)
  return function_core.run_table{
    Fastbots = 'pinChatMessage',
    chat_id = chat_id,
    message_id = message_id,
    disable_notification = disable_notification
  }
end
function Fastbots_function.unpinChatMessage(chat_id)
  return function_core.run_table{
    Fastbots = 'unpinChatMessage',
    chat_id = chat_id
  }
end
function Fastbots_function.reportSupergroupSpam(supergroup_id, user_id, message_ids)
  return function_core.run_table{
    Fastbots = 'reportSupergroupSpam',
    supergroup_id = Fastbots_function.getChatId(supergroup_id).id,
    user_id = user_id,
    message_ids = Fastbots_function.vectorize(message_ids)
  }
end
function Fastbots_function.getSupergroupMembers(supergroup_id, filter, query, offset, limit)
  local filter = filter or 'Recent'
  return function_core.run_table{
    Fastbots = 'getSupergroupMembers',
    supergroup_id = Fastbots_function.getChatId(supergroup_id).id,
    filter = {
      Fastbots = 'supergroupMembersFilter' .. filter,
      query = query
    },
    offset = offset or 0,
    limit = Fastbots_function.setLimit(200, limit)
  }
end
function Fastbots_function.deleteSupergroup(supergroup_id)
  return function_core.run_table{
    Fastbots = 'deleteSupergroup',
    supergroup_id = Fastbots_function.getChatId(supergroup_id).id
  }
end
function Fastbots_function.closeSecretChat(secret_chat_id)
  return function_core.run_table{
    Fastbots = 'closeSecretChat',
    secret_chat_id = secret_chat_id
  }
end
function Fastbots_function.getChatEventLog(chat_id, query, from_event_id, limit, filters, user_ids)
  local filters = filters or {1,1,1,1,1,1,1,1,1,1}
  return function_core.run_table{
    Fastbots = 'getChatEventLog',
    chat_id = chat_id,
    query = tostring(query) or '',
    from_event_id = from_event_id or 0,
    limit = Fastbots_function.setLimit(100, limit),
    filters = {
      Fastbots = 'chatEventLogFilters',
      message_edits = filters[0],
      message_deletions = filters[1],
      message_pins = filters[2],
      member_joins = filters[3],
      member_leaves = filters[4],
      member_invites = filters[5],
      member_promotions = filters[6],
      member_restrictions = filters[7],
      info_changes = filters[8],
      setting_changes = filters[9]
    },
    user_ids = Fastbots_function.vectorize(user_ids)
  }
end
function Fastbots_function.getSavedOrderInfo()
  return function_core.run_table{
    Fastbots = 'getSavedOrderInfo'
  }
end
function Fastbots_function.deleteSavedOrderInfo()
  return function_core.run_table{
    Fastbots = 'deleteSavedOrderInfo'
  }
end
function Fastbots_function.deleteSavedCredentials()
  return function_core.run_table{
    Fastbots = 'deleteSavedCredentials'
  }
end
function Fastbots_function.getSupportUser()
  return function_core.run_table{
    Fastbots = 'getSupportUser'
  }
end
function Fastbots_function.getWallpapers()
  return function_core.run_table{
    Fastbots = 'getWallpapers'
  }
end
function Fastbots_function.setUserPrivacySettingRules(setting, rules, allowed_user_ids, restricted_user_ids)
  local setting_rules = {
    [0] = {
      Fastbots = 'userPrivacySettingRule' .. rules
    }
  }
  if allowed_user_ids then
    setting_rules[#setting_rules + 1] = {
      {
        Fastbots = 'userPrivacySettingRuleAllowUsers',
        user_ids = Fastbots_function.vectorize(allowed_user_ids)
      }
    }
  elseif restricted_user_ids then
    setting_rules[#setting_rules + 1] = {
      {
        Fastbots = 'userPrivacySettingRuleRestrictUsers',
        user_ids = Fastbots_function.vectorize(restricted_user_ids)
      }
    }
  end
  return function_core.run_table{
    Fastbots = 'setUserPrivacySettingRules',
    setting = {
      Fastbots = 'userPrivacySetting' .. setting
    },
    rules = {
      Fastbots = 'userPrivacySettingRules',
      rules = setting_rules
    }
  }
end
function Fastbots_function.getUserPrivacySettingRules(setting)
  return function_core.run_table{
    Fastbots = 'getUserPrivacySettingRules',
    setting = {
      Fastbots = 'userPrivacySetting' .. setting
    }
  }
end
function Fastbots_function.getOption(name)
  return function_core.run_table{
    Fastbots = 'getOption',
    name = tostring(name)
  }
end
function Fastbots_function.setOption(name, option_value, value)
  return function_core.run_table{
    Fastbots = 'setOption',
    name = tostring(name),
    value = {
      Fastbots = 'optionValue' .. option_value,
      value = value
    }
  }
end
function Fastbots_function.setAccountTtl(ttl)
  return function_core.run_table{
    Fastbots = 'setAccountTtl',
    ttl = {
      Fastbots = 'accountTtl',
      days = ttl
    }
  }
end
function Fastbots_function.getAccountTtl()
  return function_core.run_table{
    Fastbots = 'getAccountTtl'
  }
end
function Fastbots_function.deleteAccount(reason)
  return function_core.run_table{
    Fastbots = 'deleteAccount',
    reason = tostring(reason)
  }
end
function Fastbots_function.getChatReportSpamState(chat_id)
  return function_core.run_table{
    Fastbots = 'getChatReportSpamState',
    chat_id = chat_id
  }
end
function Fastbots_function.reportChat(chat_id, reason, text, message_ids)
  return function_core.run_table{
    Fastbots = 'reportChat',
    chat_id = chat_id,
    reason = {
      Fastbots = 'chatReportReason' .. reason,
      text = text
    },
    message_ids = Fastbots_function.vectorize(message_ids)
  }
end
function Fastbots_function.getStorageStatistics(chat_limit)
  return function_core.run_table{
    Fastbots = 'getStorageStatistics',
    chat_limit = chat_limit
  }
end
function Fastbots_function.getStorageStatisticsFastbots()
  return function_core.run_table{
    Fastbots = 'getStorageStatisticsFastbots'
  }
end
function Fastbots_function.optimizeStorage(size, ttl, count, immunity_delay, file_type, chat_ids, exclude_chat_ids, chat_limit)
  local file_type = file_type or ''
  return function_core.run_table{
    Fastbots = 'optimizeStorage',
    size = size or -1,
    ttl = ttl or -1,
    count = count or -1,
    immunity_delay = immunity_delay or -1,
    file_type = {
      Fastbots = 'fileType' .. file_type
    },
    chat_ids = Fastbots_function.vectorize(chat_ids),
    exclude_chat_ids = Fastbots_function.vectorize(exclude_chat_ids),
    chat_limit = chat_limit
  }
end
function Fastbots_function.setNetworkType(type)
  return function_core.run_table{
    Fastbots = 'setNetworkType',
    type = {
      Fastbots = 'networkType' .. type
    },
  }
end
function Fastbots_function.getNetworkStatistics(only_current)
  return function_core.run_table{
    Fastbots = 'getNetworkStatistics',
    only_current = only_current
  }
end
function Fastbots_function.addNetworkStatistics(entry, file_type, network_type, sent_bytes, received_bytes, duration)
  local file_type = file_type or 'None'
  return function_core.run_table{
    Fastbots = 'addNetworkStatistics',
    entry = {
      Fastbots = 'networkStatisticsEntry' .. entry,
      file_type = {
        Fastbots = 'fileType' .. file_type
      },
      network_type = {
        Fastbots = 'networkType' .. network_type
      },
      sent_bytes = sent_bytes,
      received_bytes = received_bytes,
      duration = duration
    }
  }
end
function Fastbots_function.resetNetworkStatistics()
  return function_core.run_table{
    Fastbots = 'resetNetworkStatistics'
  }
end
function Fastbots_function.getCountryCode()
  return function_core.run_table{
    Fastbots = 'getCountryCode'
  }
end
function Fastbots_function.getInviteText()
  return function_core.run_table{
    Fastbots = 'getInviteText'
  }
end
function Fastbots_function.getTermsOfService()
  return function_core.run_table{
    Fastbots = 'getTermsOfService'
  }
end
function Fastbots_function.sendText(chat_id, reply_to_message_id, text, parse_mode, disable_web_page_preview, clear_draft, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageText',
    disable_web_page_preview = disable_web_page_preview,
    text = {text = text},
    clear_draft = clear_draft
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendAnimation(chat_id, reply_to_message_id, animation, caption, parse_mode, duration, width, height, thumbnail, thumb_width, thumb_height, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageAnimation',
    animation = Fastbots_function.getInputFile(animation),
    thumbnail = {
      Fastbots = 'inputThumbnail',
      thumbnail = Fastbots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    caption = {text = caption},
    duration = duration,
    width = width,
    height = height
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendA(chat_id, reply_to_message_id, audio, caption)
local input_message_content = {
Fastbots = 'inputMessageAudio',
audio = audio,
caption = {text = caption},
}
return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content)
end
function Fastbots_function.sendAudio(chat_id, reply_to_message_id, audio, caption, parse_mode, duration, title, performer, thumbnail, thumb_width, thumb_height, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageAudio',
    audio = Fastbots_function.getInputFile(audio),
    album_cover_thumbnail = {
      Fastbots = 'inputThumbnail',
      thumbnail = Fastbots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    caption = {text = caption},
    duration = duration,
    title = tostring(title),
    performer = tostring(performer)
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendDocument(chat_id, reply_to_message_id, document, caption, parse_mode, thumbnail, thumb_width, thumb_height, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageDocument',
    document = Fastbots_function.getInputFile(document),
    thumbnail = {
      Fastbots = 'inputThumbnail',
      thumbnail = Fastbots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    caption = {text = caption}
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendPhoto(chat_id, reply_to_message_id, photo, caption, parse_mode, added_sticker_file_ids, width, height, ttl, thumbnail, thumb_width, thumb_height, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessagePhoto',
    photo = Fastbots_function.getInputFile(photo),
    thumbnail = {
      Fastbots = 'inputThumbnail',
      thumbnail = Fastbots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    caption = {text = caption},
    added_sticker_file_ids = Fastbots_function.vectorize(added_sticker_file_ids),
    width = width,
    height = height,
    ttl = ttl or 0
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendSticker(chat_id, reply_to_message_id, sticker, width, height, disable_notification, thumbnail, thumb_width, thumb_height, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageSticker',
    sticker = Fastbots_function.getInputFile(sticker),
    thumbnail = {
      Fastbots = 'inputThumbnail',
      thumbnail = Fastbots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    width = width,
    height = height
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendVideo(chat_id, reply_to_message_id, video, caption, parse_mode, added_sticker_file_ids, duration, width, height, ttl, thumbnail, thumb_width, thumb_height, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageVideo',
    video = Fastbots_function.getInputFile(video),
    thumbnail = {
      Fastbots = 'inputThumbnail',
      thumbnail = Fastbots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    caption = {text = caption},
    added_sticker_file_ids = Fastbots_function.vectorize(added_sticker_file_ids),
    duration = duration,
    width = width,
    height = height,
    ttl = ttl
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendVideoNote(chat_id, reply_to_message_id, video_note, duration, length, thumbnail, thumb_width, thumb_height, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageVideoNote',
    video_note = Fastbots_function.getInputFile(video_note),
    thumbnail = {
      Fastbots = 'inputThumbnail',
      thumbnail = Fastbots_function.getInputFile(thumbnail),
      width = thumb_width,
      height = thumb_height
    },
    duration = duration,
    length = length
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendVoiceNote(chat_id, reply_to_message_id, voice_note, caption, parse_mode, duration, waveform, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageVoiceNote',
    voice_note = Fastbots_function.getInputFile(voice_note),
    caption = {text = caption},
    duration = duration,
    waveform = waveform
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendLocation(chat_id, reply_to_message_id, latitude, longitude, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageLocation',
    location = {
      Fastbots = 'location',
      latitude = latitude,
      longitude = longitude
    },
    live_period = liveperiod
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendVenue(chat_id, reply_to_message_id, latitude, longitude, title, address, provider, id, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageVenue',
    venue = {
      Fastbots = 'venue',
      location = {
        Fastbots = 'location',
        latitude = latitude,
        longitude = longitude
      },
      title = tostring(title),
      address = tostring(address),
      provider = tostring(provider),
      id = tostring(id)
    }
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendContact(chat_id, reply_to_message_id, phone_number, first_name, last_name, user_id, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageContact',
    contact = {
      Fastbots = 'contact',
      phone_number = tostring(phone_number),
      first_name = tostring(first_name),
      last_name = tostring(last_name),
      user_id = user_id
    }
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendInvoice(chat_id, reply_to_message_id, invoice, title, description, photo_url, photo_size, photo_width, photo_height, payload, provider_token, provider_data, start_parameter, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageInvoice',
    invoice = invoice,
    title = tostring(title),
    description = tostring(description),
    photo_url = tostring(photo_url),
    photo_size = photo_size,
    photo_width = photo_width,
    photo_height = photo_height,
    payload = payload,
    provider_token = tostring(provider_token),
    provider_data = tostring(provider_data),
    start_parameter = tostring(start_parameter)
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendForwarded(chat_id, reply_to_message_id, from_chat_id, message_id, in_game_share, disable_notification, from_background, reply_markup)
  local input_message_content = {
    Fastbots = 'inputMessageForwarded',
    from_chat_id = from_chat_id,
    message_id = message_id,
    in_game_share = in_game_share
  }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, nil, disable_notification, from_background, reply_markup)
end
function Fastbots_function.sendPoll(chat_id, reply_to_message_id, question, options, pollType, is_anonymous, allow_multiple_answers)
  local input_message_content = {
      Fastbots = 'inputMessagePoll',
      is_anonymous = is_anonymous,
      question = question,
      type = {
        Fastbots = 'pollType'..pollType,
        allow_multiple_answers = allow_multiple_answers
      },
      options = options
    }
  return Fastbots_function.sendMessage(chat_id, reply_to_message_id, input_message_content, parse_mode, disable_notification, from_background, reply_markup)
end
function Fastbots_function.getPollVoters(chat_id, message_id, option_id, offset, limit)
  return function_core.run_table{
    Fastbots = 'getPollVoters',
    chat_id = chat_id,
    message_id = message_id,
    option_id = option_id,
    limit = Fastbots_function.setLimit(50 , limit),
    offset = offset
  }
end
function Fastbots_function.setPollAnswer(chat_id, message_id, option_ids)
  return function_core.run_table{
    Fastbots = 'setPollAnswer',
    chat_id = chat_id,
    message_id = message_id,
    option_ids = option_ids
  }
end
function Fastbots_function.stopPoll(chat_id, message_id, reply_markup)
  return function_core.run_table{
    Fastbots = 'stopPoll',
    chat_id = chat_id,
    message_id = message_id,
    reply_markup = reply_markup
  }
end
function Fastbots_function.getInputMessage(value)
  if type(value) ~= 'table' then
    return value
  end
  if type(value.type) == 'string' then
    if value.parse_mode and value.caption then
      caption = Fastbots_function.parseTextEntities(value.caption, value.parse_mode)
    elseif value.caption and not value.parse_mode then
      caption = {
        text = value.caption
      }
    elseif value.parse_mode and value.text then
      text = Fastbots_function.parseTextEntities(value.text, value.parse_mode)
    elseif not value.parse_mode and value.text then
      text = {
        text = value.text
      }
    end
    value.type = string.lower(value.type)
    if value.type == 'text' then
      return {
        Fastbots = 'inputMessageText',
        disable_web_page_preview = value.disable_web_page_preview,
        text = text,
        clear_draft = value.clear_draft
      }
    elseif value.type == 'animation' then
      return {
        Fastbots = 'inputMessageAnimation',
        animation = Fastbots_function.getInputFile(value.animation),
        thumbnail = {
          Fastbots = 'inputThumbnail',
          thumbnail = Fastbots_function.getInputFile(value.thumbnail),
          width = value.thumb_width,
          height = value.thumb_height
        },
        caption = caption,
        duration = value.duration,
        width = value.width,
        height = value.height
      }
    elseif value.type == 'audio' then
      return {
        Fastbots = 'inputMessageAudio',
        audio = Fastbots_function.getInputFile(value.audio),
        album_cover_thumbnail = {
          Fastbots = 'inputThumbnail',
          thumbnail = Fastbots_function.getInputFile(value.thumbnail),
          width = value.thumb_width,
          height = value.thumb_height
        },
        caption = caption,
        duration = value.duration,
        title = tostring(value.title),
        performer = tostring(value.performer)
      }
    elseif value.type == 'document' then
      return {
        Fastbots = 'inputMessageDocument',
        document = Fastbots_function.getInputFile(value.document),
        thumbnail = {
          Fastbots = 'inputThumbnail',
          thumbnail = Fastbots_function.getInputFile(value.thumbnail),
          width = value.thumb_width,
          height = value.thumb_height
        },
        caption = caption
      }
    elseif value.type == 'photo' then
      return {
        Fastbots = 'inputMessagePhoto',
        photo = Fastbots_function.getInputFile(value.photo),
        thumbnail = {
          Fastbots = 'inputThumbnail',
          thumbnail = Fastbots_function.getInputFile(value.thumbnail),
          width = value.thumb_width,
          height = value.thumb_height
        },
        caption = caption,
        added_sticker_file_ids = Fastbots_function.vectorize(value.added_sticker_file_ids),
        width = value.width,
        height = value.height,
        ttl = value.ttl or 0
      }
    elseif value.text == 'video' then
      return {
        Fastbots = 'inputMessageVideo',
        video = Fastbots_function.getInputFile(value.video),
        thumbnail = {
          Fastbots = 'inputThumbnail',
          thumbnail = Fastbots_function.getInputFile(value.thumbnail),
          width = value.thumb_width,
          height = value.thumb_height
        },
        caption = caption,
        added_sticker_file_ids = Fastbots_function.vectorize(value.added_sticker_file_ids),
        duration = value.duration,
        width = value.width,
        height = value.height,
        ttl = value.ttl or 0
      }
    elseif value.text == 'videonote' then
      return {
        Fastbots = 'inputMessageVideoNote',
        video_note = Fastbots_function.getInputFile(value.video_note),
        thumbnail = {
          Fastbots = 'inputThumbnail',
          thumbnail = Fastbots_function.getInputFile(value.thumbnail),
          width = value.thumb_width,
          height = value.thumb_height
        },
        duration = value.duration,
        length = value.length
      }
    elseif value.text == 'voice' then
      return {
        Fastbots = 'inputMessageVoiceNote',
        voice_note = Fastbots_function.getInputFile(value.voice_note),
        caption = caption,
        duration = value.duration,
        waveform = value.waveform
      }
    elseif value.text == 'location' then
      return {
        Fastbots = 'inputMessageLocation',
        location = {
          Fastbots = 'location',
          latitude = value.latitude,
          longitude = value.longitude
        },
        live_period = value.liveperiod
      }
    elseif value.text == 'contact' then
      return {
        Fastbots = 'inputMessageContact',
        contact = {
          Fastbots = 'contact',
          phone_number = tostring(value.phone_number),
          first_name = tostring(value.first_name),
          last_name = tostring(value.last_name),
          user_id = value.user_id
        }
      }
    elseif value.text == 'contact' then
      return {
        Fastbots = 'inputMessageContact',
        contact = {
          Fastbots = 'contact',
          phone_number = tostring(value.phone_number),
          first_name = tostring(value.first_name),
          last_name = tostring(value.last_name),
          user_id = value.user_id
        }
      }
    end
  end
end
function Fastbots_function.editInlineMessageText(inline_message_id, input_message_content, reply_markup)
  return function_core.run_table{
    Fastbots = 'editInlineMessageText',
    input_message_content = Fastbots_function.getInputMessage(input_message_content),
    reply_markup = reply_markup
  }
end
function Fastbots_function.answerInlineQuery(inline_query_id, results, next_offset, switch_pm_text, switch_pm_parameter, is_personal, cache_time)
  local answerInlineQueryResults = {}
  for key, value in pairs(results) do
    local newAnswerInlineQueryResults_id = #answerInlineQueryResults + 1
    if type(value) == 'table' and type(value.type) == 'string' then
      value.type = string.lower(value.type)
      if value.type == 'gif' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultAnimatedGif',
          id = value.id,
          title = value.title,
          thumbnail_url = value.thumbnail_url,
          gif_url = value.gif_url,
          gif_duration = value.gif_duration,
          gif_width = value.gif_width,
          gif_height = value.gif_height,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      elseif value.type == 'mpeg4' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultAnimatedMpeg4',
          id = value.id,
          title = value.title,
          thumbnail_url = value.thumbnail_url,
          mpeg4_url = value.mpeg4_url,
          mpeg4_duration = value.mpeg4_duration,
          mpeg4_width = value.mpeg4_width,
          mpeg4_height = value.mpeg4_height,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      elseif value.type == 'article' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultArticle',
          id = value.id,
          url = value.url,
          hide_url = value.hide_url,
          title = value.title,
          description = value.description,
          thumbnail_url = value.thumbnail_url,
          thumbnail_width = value.thumbnail_width,
          thumbnail_height = value.thumbnail_height,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      elseif value.type == 'audio' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultAudio',
          id = value.id,
          title = value.title,
          performer = value.performer,
          audio_url = value.audio_url,
          audio_duration = value.audio_duration,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      elseif value.type == 'contact' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultContact',
          id = value.id,
          contact = value.contact,
          thumbnail_url = value.thumbnail_url,
          thumbnail_width = value.thumbnail_width,
          thumbnail_height = thumbnail_height.description,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      elseif value.type == 'document' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultDocument',
          id = value.id,
          title = value.title,
          description = value.description,
          document_url = value.document_url,
          mime_type = value.mime_type,
          thumbnail_url = value.thumbnail_url,
          thumbnail_width = value.thumbnail_width,
          thumbnail_height = value.thumbnail_height,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      elseif value.type == 'game' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultGame',
          id = value.id,
          game_short_name = value.game_short_name,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      elseif value.type == 'location' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultLocation',
          id = value.id,
          location = value.location,
          live_period = value.live_period,
          title = value.title,
          thumbnail_url = value.thumbnail_url,
          thumbnail_width = value.thumbnail_width,
          thumbnail_height = value.thumbnail_height,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      elseif value.type == 'photo' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultPhoto',
          id = value.id,
          title = value.title,
          description = value.description,
          thumbnail_url = value.thumbnail_url,
          photo_url = value.photo_url,
          photo_width = value.photo_width,
          photo_height = value.photo_height,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      elseif value.type == 'sticker' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultSticker',
          id = value.id,
          thumbnail_url = value.thumbnail_url,
          sticker_url = value.sticker_url,
          sticker_width = value.sticker_width,
          sticker_height = value.sticker_height,
          photo_width = value.photo_width,
          photo_height = value.photo_height,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      elseif value.type == 'sticker' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultSticker',
          id = value.id,
          thumbnail_url = value.thumbnail_url,
          sticker_url = value.sticker_url,
          sticker_width = value.sticker_width,
          sticker_height = value.sticker_height,
          photo_width = value.photo_width,
          photo_height = value.photo_height,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      elseif value.type == 'video' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultVideo',
          id = value.id,
          title = value.title,
          description = value.description,
          thumbnail_url = value.thumbnail_url,
          video_url = value.video_url,
          mime_type = value.mime_type,
          video_width = value.video_width,
          video_height = value.video_height,
          video_duration = value.video_duration,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      elseif value.type == 'videonote' then
        answerInlineQueryResults[newAnswerInlineQueryResults_id] = {
          Fastbots = 'inputInlineQueryResultVoiceNote',
          id = value.id,
          title = value.title,
          voice_note_url = value.voice_note_url,
          voice_note_duration = value.voice_note_duration,
          reply_markup = Fastbots_function.replyMarkup{
            type = 'inline',
            data = value.reply_markup
          },
          input_message_content = Fastbots_function.getInputMessage(value.input)
        }
      end
    end
  end
  return function_core.run_table{
    Fastbots = 'answerInlineQuery',
    inline_query_id = inline_query_id,
    next_offset = next_offset,
    switch_pm_text = switch_pm_text,
    switch_pm_parameter = switch_pm_parameter,
    is_personal = is_personal,
    cache_time = cache_time,
    results = answerInlineQueryResults,
  }
end
function Fastbots.VERSION()
  print(Fastbots_function.colors('%{green}\27[5m'..Fastbots.logo..'\n this fucked by @FPFFG'))
  return true
end
function Fastbots.run(main_def, filters)
  if type(main_def) ~= 'function' then
    function_core.print_error('the run main_def must be a main function !')
    os.exit(1)
  else
    update_functions[0] = {}
    update_functions[0].def = main_def
    update_functions[0].filters = filters
  end
  while Fastbots.get_update do
    for timer_id, timer_data in pairs(Fastbots_timer) do
      if os.time() >= timer_data.run_in then
        xpcall(timer_data.def, function_core.print_error,timer_data.argv)
        table.remove(Fastbots_timer,timer_id)
      end
    end
    local update = function_core.change_table(client:receive(1))
    if update then
      if type(update) ~= 'table' then
          goto finish
      end
      if Fastbots.login(update) then
        function_core._CALL_(update)
      end
    end
    ::finish::
  end
end
function Fastbots.set_config(data)
  Fastbots.VERSION()
  if not data.api_hash then
    print(Fastbots_function.colors('%{yellow} Please enter AP_HASH to call'))
    os.exit()
  end
  if not data.api_id then
    print(Fastbots_function.colors('%{yellow} Please enter API_ID to call'))
    os.exit()
  end
  if not data.session_name then
    print(Fastbots_function.colors('%{yellow} please use session_name in your script !'))
    os.exit()
  end
  if not data.token and not Fastbots_function.exists('.CallBack-Bot/'..data.session_name) then
    io.write(Fastbots_function.colors('\n%{green} Please enter Token or Phone to call'))
    local phone_token = io.read()
    if phone_token:match('%d+:') then
      Fastbots.config.is_bot = true
      Fastbots.config.token = phone_token
    else
      Fastbots.config.is_bot = false
      Fastbots.config.phone = phone_token
    end
  elseif data.token and not Fastbots_function.exists('.CallBack-Bot/'..data.session_name) then
    Fastbots.config.is_bot = true
    Fastbots.config.token = data.token
  end
  if not Fastbots_function.exists('.CallBack-Bot') then
    os.execute('sudo mkdir .CallBack-Bot')
  end
  Fastbots.config.encryption_key = data.encryption_key or ''
  Fastbots.config.parameters = {
    Fastbots = 'setTdlibParameters',
    use_message_database = data.use_message_database or true,
    api_id = data.api_id,
    api_hash = data.api_hash,
    use_secret_chats = use_secret_chats or true,
    system_language_code = data.language_code or 'en',
    device_model = 'Fastbots',
    system_version = data.system_version or 'linux',
    application_version = '1.0',
    enable_storage_optimizer = data.enable_storage_optimizer or true,
    use_pfs = data.use_pfs or true,
    database_directory = '.CallBack-Bot/'..data.session_name
  }
  return Fastbots_function
end
function Fastbots.set_bot(data)
  Fastbots.VERSION()
  if not data.api_hash then
    print(Fastbots_function.colors('%{yellow} Please enter AP_HASH to call'))
    os.exit()
  end
  if not data.api_id then
    print(Fastbots_function.colors('%{yellow} Please enter API_ID to call'))
    os.exit()
  end
  if not data.session_name then
    print(Fastbots_function.colors('%{yellow} please use session_name in your script !'))
    os.exit()
  end
  if not data.token and not Fastbots_function.exists('.Call/'..data.session_name) then
    io.write(Fastbots_function.colors('\n%{green} Please enter Token or Phone to call'))
    local phone_token = io.read()
    if phone_token:match('%d+:') then
      Fastbots.config.is_bot = true
      Fastbots.config.token = phone_token
    else
      Fastbots.config.is_bot = false
      Fastbots.config.phone = phone_token
    end
  elseif data.token and not Fastbots_function.exists('.Call/'..data.session_name) then
    Fastbots.config.is_bot = true
    Fastbots.config.token = data.token
  end
  if not Fastbots_function.exists('.Call') then
    os.execute('sudo mkdir .Call')
  end
  Fastbots.config.encryption_key = data.encryption_key or ''
  Fastbots.config.parameters = {
    Fastbots = 'setTdlibParameters',
    use_message_database = data.use_message_database or true,
    api_id = data.api_id,
    api_hash = data.api_hash,
    use_secret_chats = use_secret_chats or true,
    system_language_code = data.language_code or 'en',
    device_model = 'Fastbots',
    system_version = data.system_version or 'linux',
    application_version = '1.0',
    enable_storage_optimizer = data.enable_storage_optimizer or true,
    use_pfs = data.use_pfs or true,
    database_directory = '.Call/'..data.session_name
  }
  return Fastbots_function
end
function Fastbots.login(state)
  if state.name == 'version' and state.value and state.value.value then
  elseif state.authorization_state and state.authorization_state.Fastbots == 'error' and (state.authorization_state.message == 'PHONE_NUMBER_INVALID' or state.authorization_state.message == 'ACCESS_TOKEN_INVALID') then
    if state.authorization_state.message == 'PHONE_NUMBER_INVALID' then
      print(Fastbots_function.colors('%{red} Phone Number invalid Error ?!'))
    else
      print(Fastbots_function.colors('%{yellow} Token Bot invalid Error ?!'))
    end
    io.write(Fastbots_function.colors('\n%{green} Please Use Token or Phone to call : '))
    local phone_token = io.read()
    if phone_token:match('%d+:') then
      function_core.send_tdlib{
        Fastbots = 'checkAuthenticationBotToken',
        token = phone_token
      }
    else
      function_core.send_tdlib{
        Fastbots = 'setAuthenticationPhoneNumber',
        phone_number = phone_token
      }
    end
  elseif state.authorization_state and state.authorization_state.Fastbots == 'error' and state.authorization_state.message == 'PHONE_CODE_INVALID' then
    io.write(Fastbots_function.colors('\n%{green}The Code : '))
    local code = io.read()
    function_core.send_tdlib{
      Fastbots = 'checkAuthenticationCode',
      code = code
    }
  elseif state.authorization_state and state.authorization_state.Fastbots == 'error' and state.authorization_state.message == 'PASSWORD_HASH_INVALID' then
    print(Fastbots_function.colors('%{red}two-step is wrong !'))
    io.write(Fastbots_function.colors('\n%{green}The Password : '))
    local password = io.read()
    function_core.send_tdlib{
      Fastbots = 'checkAuthenticationPassword',
      password = password
    }
  elseif state.Fastbots == 'authorizationStateWaitTdlibParameters' or (state.authorization_state and state.authorization_state.Fastbots == 'authorizationStateWaitTdlibParameters') then
    function_core.send_tdlib{
      Fastbots = 'setTdlibParameters',
      parameters = Fastbots.config.parameters
    }
  elseif state.authorization_state and state.authorization_state.Fastbots == 'authorizationStateWaitEncryptionKey' then
    function_core.send_tdlib{
      Fastbots = 'checkDatabaseEncryptionKey',
      encryption_key = Fastbots.config.encryption_key
    }
  elseif state.authorization_state and state.authorization_state.Fastbots == 'authorizationStateWaitPhoneNumber' then
    if Fastbots.config.is_bot then
      function_core.send_tdlib{
        Fastbots = 'checkAuthenticationBotToken',
        token = Fastbots.config.token
      }
    else
      function_core.send_tdlib{
        Fastbots = 'setAuthenticationPhoneNumber',
        phone_number = Fastbots.config.phone
      }
    end
  elseif state.authorization_state and state.authorization_state.Fastbots == 'authorizationStateWaitCode' then
      io.write(Fastbots_function.colors('\n%{green}The Password : '))
      local code = io.read()
      function_core.send_tdlib{
        Fastbots = 'checkAuthenticationCode',
        code = code
      }
  elseif state.authorization_state and state.authorization_state.Fastbots == 'authorizationStateWaitPassword' then
      io.write(Fastbots_function.colors('\n%{green}Password [ '..state.authorization_state.password_hint..' ] : '))
      local password = io.read()
      function_core.send_tdlib{
        Fastbots = 'checkAuthenticationPassword',
        password = password
      }
  elseif state.authorization_state and state.authorization_state.Fastbots == 'authorizationStateWaitRegistration' then
    io.write(Fastbots_function.colors('\n%{green}The First name : '))
    local first_name = io.read()
    io.write(Fastbots_function.colors('\n%{green}The Last name : '))
    local last_name = io.read()
    function_core.send_tdlib{
      Fastbots = 'registerUser',
      first_name = first_name,
      last_name = last_name
    }
  elseif state.authorization_state and state.authorization_state.Fastbots == 'authorizationStateReady' then
    print(Fastbots_function.colors("%{yellow}The files have been connected and played ...\n"))
  elseif state.authorization_state and state.authorization_state.Fastbots == 'authorizationStateClosed' then
    print(Fastbots_function.colors('%{yellow}>> authorization state closed '))
    Fastbots.get_update = false
  elseif state.Fastbots == 'error' and state.message then
  elseif not (state.Fastbots and Fastbots_function.in_array({'updateConnectionState', 'updateSelectedBackground', 'updateConnectionState', 'updateOption',}, state.Fastbots)) then
    return true
  end
end
return {
Fastbots = Fastbots,
xnxx = xnxx
}
