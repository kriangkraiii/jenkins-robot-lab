*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Browser To Login Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    
    # [ต้องแก้ 1] บอก Robot ว่า Browser ของเราอยู่ที่ไหน (ถ้าไม่ใส่บรรทัดนี้ พัง!)
    ${chrome_options.binary_location}=    Set Variable    /usr/bin/chromium

    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    
    # [ต้องแก้ 2] บอก Robot ว่า Driver อยู่ที่ไหน (ถ้าไม่ใส่บรรทัดนี้ พัง!)
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path='/usr/bin/chromedriver')    sys, selenium.webdriver.chrome.service

    # [ต้องแก้ 3] ส่ง service เข้าไปในคำสั่งสร้าง Webdriver
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    
    Go To    https://computing.kku.ac.th