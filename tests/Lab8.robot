*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Login Page
    # 1. สร้าง Chrome Options
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    
    # [สำคัญมาก] ถึงจะมี Manager แต่ต้องบอกว่า Browser อยู่ไหน ไม่งั้นมันหา Chrome ไม่เจอ
    ${chrome_options.binary_location}=    Set Variable    /usr/bin/chromium

    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless

    # 2. ใช้ Webdriver Manager โหลด Driver อัตโนมัติ
    # มันจะไปโหลด driver ที่เข้ากับ chromium มาให้ แล้วส่ง path กลับมา
    ${driver_path}=    Evaluate    sys.modules['webdriver_manager.chrome'].ChromeDriverManager().install()    sys, webdriver_manager.chrome
    
    # 3. สร้าง Service จาก Path ที่ Manager หามาให้
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r'${driver_path}')    sys, selenium.webdriver.chrome.service

    # 4. สร้าง Webdriver
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    
    Go To    https://computing.kku.ac.th
    Title Should Be    College of Computing, Khon Kaen University