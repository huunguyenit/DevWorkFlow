<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY Controller "SFCMachineCenter">
  <!ENTITY TransferID "SFCMachineCenter">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaMrUiwQxybGBDczEF+qL7Y8qEtKb2mZjLvoYF7FYWg0z6DWYuUnXTGAVD5IY9eDm6Xl0XoALR8iKGCotR5G1YAVHPPyIuM2BLpMvx+nBUubo6t7ASYTHr3nn4ijrQhVMlLI9iheK0LWbVrfqRmwJ05G1I7wHBh+3kk5Wif+GrwbQ==FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  
]>

<grid table="sfdmcummay" code="ma_cm" order="ma_cm" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Danh mục cụm máy" e="Machine Center List"></title>
  <subTitle v="Cập nhật cụm máy: thêm, sửa, xóa..." e="Add, Edit, Delete Machine Center..."></subTitle>

  <fields>
    <field name="ma_cm" isPrimaryKey="true" width="100" dataFormatString="X" allowSorting="true" allowFilter="true">
      <header v="Mã cụm máy" e="Machine Center Code"></header>
    </field>
    <field name="ten_cm%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên cụm máy" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_cm"/>
      <field name="ten_cm%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzJsR3S2mb+KQZ7lfiENoRQemlKsQfOkrDtEvZAOBaivk=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKvjuPmFP28V0XIguONEHyHAxgittBauFoeZamfZbnXYS3/AUZrEF1DM+oyQW4Rj0DcTvcklyu62d7QxMYe31JI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL751wZiTGtWeHzFQZhMwU6K2dxZTKcK8IzZ4gALgNH9xBQ</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFccvlF+UYh75UKXSvDykln3Ickvc7nixhs5a/aB/aYnA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1wTIuS3c4MMVcs8FKGb8qqXV23YEt0552rcUoDfszkM3EGjRuRI8K7n4fITlWdwKwQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgXKNAuElAZjz4ecWTJ8dS9E4hjAhmKtfg677hCLEwXcj9eM7kzP0X5PzWMa6eqBE8=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAA9cvAXz3YyJErBlwgYgm+KJqn2j7wKdflbqAKLp8sGeg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1/Q0Y+c0aMeoPR87DyalPICmOczjn3IYen8eps/nqqtn8Pecki1VhfETECaIHJMlaA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqu2lHuxmjkVCaSy+1KF7qJdjMycOlSdvOonHBsJv7YSH</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2n6CrlqvGBxmeCI+tjvm78OPtZ3HMJzkMoOFadTEVyhpc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucDXRIFFn50U2np97XSqKulGUFHoVjzR6nzTldDGoKC4IH7f/gQHG3Z6NN9jKU1enxJoAN4fGI8wzP2h+W3fhqBEBjWOy+hMUTwYpz+8SC6HW+1zC18R7rcOfWBTRatEP5A+LYW7433/cj88F3380HN6c7rl3h8dfE9hWW3Uarl7Q==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNeKKm32SaB99HKy6e6irdF1PdUlmnMNn8JPDEmCiQFG+1FlSxdXJz75TV5qGY3vD7WznqZK9k18/lCpFqftldqleN0DedQ8AqYWc0qUQ31P5NW7aSuqfhs7SRE3LkBOz6NeNW4CJ7hBGKlvy9FQ0/aYe2ORkydZEw1BStd1/QItBKIcHH/Mg3dhdM7Z73qL3GXc56xwrrFc2Ffiz9lu1TwXfl9SwqL/7t6CTh5lwxPZ05Xk3+nxI7hIVCN39UNRGOhQLAL/sQ9KnDFgNsubJnfk</Encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7Q2ZgN87qIJvPvG6Hzq8L9loaCflvmvkNH8VLZ2CkRZovJCEiJ6AR3gqMbkiE31/Oc3ZzMUpRFDqWVExQBJV+Zr88IlDe/oSzZRA1t8b0/0w3BqTKi7PnWnO02iO/Cwi4Gr5JH1yfJJpAAx17dZWFyA05PJJcj/N8dU0K9UVDsl</Encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>