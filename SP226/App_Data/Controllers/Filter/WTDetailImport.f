<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "WTDetailImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY ImportUserDefinedFields "ma_vv, ma_bp, so_lsx, ma_sp, ma_hd, ma_phi, ma_ku">
  <!ENTITY % UserDefinedImport SYSTEM "..\Include\Javascript\UserDefinedImport.ent">
  %UserDefinedImport;
]>

<dir table="d65$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0"/>
      <item value="11000101: [upload].Label, [upload], [upload].Description, [ticket]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwv3wLHXTDVbx2DdB9PPcGaDBXwbv0oh/z6PNxPtXBr0B91Yn0501vvwtUQ50sTOYA==</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI7200INbRFwrRV1ygt8qMKFvYMS2nnkKHRJzehg/NGQyg5N95QkHSh1LGHn1Ue+VCg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%yb3r8nYg0FPwFXMJ1/oFI7200INbRFwrRV1ygt8qMKFvYMS2nnkKHRJzehg/NGQyg5N95QkHSh1LGHn1Ue+VCg==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0+1ZinyAG8T7kDc/L8uThKSQD70ZPMPLMQT9WlVUGrTVfV8TqcCujG4EACapTFShigX50sEXEPoPl4+r07y4sL9lrk53rmrTTavkE+UVkP/Pw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%/vOP2em6Xhs7Z9GPyNAHjjBNhSB4n36RAHIrC3EsIUZOJpgG4hHoR/Q/8hBmCxWHSUmQylFesVOE3pC3Wxw6g6DMmVv1vBozKq0VnniMXHAQlO5NkMmzW4Blq17syK8lqKEVrosC7hOMH2nm8XIbGLDF0tPk94fmB0my8pW5Phdm7OgeBLKpCRVZNMEbvc2A0GnBa4TqTRcFhvL5+oacqMIa+VuBI+EHtVwf38yu5/ZGh6OxRMCZNBYirywQXFYPbnbPDGutXcEhqCPOhknF7jf28s76Y52dAeqRl/GFAnsQVS8FhzZpcFyzIzMe8K+UJbT/y6dZDTr7+i8gEZTSl/weX4RHRQcP+Pte0BCR/kd5b6frC5Q1STQGJogKoKbrB41LD3/qtHrtVzq+1iouug==</encrypted>]]>&Identity;<![CDATA[<encrypted>%tKdK3MWmxeikauzyRrII1ouiHwnF/5cGuyztb5FgU+/6lRK7YdRPkOz+ZOaCD9LFeFazobuKWl7vluiaaBKObKEJtKg979tEXAErnj37bqfwsYCJGpiaCHJXR+kuqzlxaLWvWbYEyY8r/gVbHl6cHirpvdxUSGvb3EYmQAo5tO0=</encrypted>]]>&Identity;<![CDATA[<encrypted>%/AfHL6YdajQfFcOwzqzJsHPCFLHOMub5jKaSv4gpZKzHmpq1NMHCpGxFxLNVRPuV7aH7UH3wkeIrYGNInhIWGqsfhPVfwRNTOZo7w0edNYd8LZkeOvy8CSAfqiqPya1yub5RULGeW+DH0O16YMVWHgdJUk8vrrki7HdXxftMZO5tca7S2i/kNngRu3idNMuu3ZUJU2+/mzBmBYZYSQCVvYwroJtPGMr482uiWR5znMo6GxoxHUydwVEYZDibX9u6rDziH+l8ky9xkbZLGFr4MEzGc199IMUW0KaaoGwuk1b9lJgxtwRFiZ2A1caMg4wOO/OljLA6RZ6ohqeRxL1lLQs4eRLq7tH9gF0QYZaSAx4T3fR45oWL2AfaDTbPuTBowsQVvdBCZoWjiuAgox7U5MGBIN+SNIBFU/yqYV1morjPiitWEedpfociC8/PBSwOmHY/xT5BmK+l6fJV8re4L1L5nfMGAD6D/c4JVt17Zi2BWTFiMhzRRCSvfV8HSpWcaM1fWYDhIK5+PNqirc4X4Oz2OJQdkPLUm8P6CdT7s9Kne46iIXQe0m9X/B+01G/jq1rxMM9jkz9fk5SoNnZmcA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%rnZ922lNpfjaCeWsVZkA0WZiYw6XUQtQ2WPvtce3XMkAbvUh26+cM+Y6LHeeTBT66ltoDlSplfNkb+5A8FrLQlnK4FPFnqUpyAU4IeKFBysJuvmfDda46O8EczcRtmD0itwf8E9WbIHwLId2BMdi2Kma+eih+uabr+eiwrCYFxbWkMdoaxw/9UGUZWYMnrv68or3FcNmj7ejuE5G5ZkszzD4U3nP63hi+G31CBzW5iO3bqQtYKSkO6dcHlSOgMg9uRxmA/nMRlm5k2mFDZ/owg==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfMY+vxj5ddyyoutgGhLGg+wsbG4kDSfy9Br7CB81Z0C7Y8d+ocmYlcPxUdK5t6UahCErdMQpGylb9O/5okkAcaY9W5HHck54MnGXVjfbDE4ymhDUkl34azliBxi4OZbMgvLSdZ5wqBKouGmoCnhegmm2GWWTsOOWSJ3Tj9lduQjbaII2ftCq90T3jb2YF0Uaz7TXHm/iYyTebNi2W05cvtUbLgZI4ok+S3aanT//27PpnV4Y58A/TA/rk7MFPPzYh1c5NwyGtIqERRGcxeL0JkCgAqBNdpR8eQ7iwuFfFmgHgi7M6D3/+vnmrwwBGR59fqUv/alLlGpO8YbwshYURAKYQWw/x39i4mwS64/8aHGgUIbd0STc5bVTWjP+ACybas5UH4ISczhGA/+iw9bc5c7al7Q/RuFmJWQaWE2SNHjhv6H0ebh7eP0SME1v44W5/jftue8n0L5ro07/1auUGm1jXAnpKAWIhjNaqM/r0EA3NusJ7zf7PI51Vaoz+/HcZhV0aAAoGAF6i9C4dfDzLB4=</encrypted>]]>&ImportUserDefinedDeclare;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KnlgkiUi6dBFu+VLE6q99412LD1P+4vBDxzZ5hJf2mN1eVMMvv4YYJC5p2ShN3+kXFpdCpCDsjjRP/TAkTwm8nMdpfw37qZCsAxy5AWpsQvUi+wgc+niPQual/xoW4/hWWtXTiKFuIlORlshqgFQPeWSVxDMYpoSrVlcwCKCX3tNNkIhE/CASHnkvBNfByOUCg==</encrypted>]]>&ImportUserDefinedFields;<![CDATA[<encrypted>%tQIWXAkmAd+Wv5oPcBmyV8SZnDu4EJszYXEcpc01h6qStXPlgos3zFKLKtS6RuaYAAcL8wAHp7Ud8gnLP4MKMasRezactUlWntcd4Cv74TrwWXK0Es1Ct/Jn0RI/44QlnI5PIO8VDJyWM8EFMK8IpYmMCDoO8eysg6O955JI+I4TPd5Oeh4YCiSQrTw1jvTJr+Cq22ohYz/BROdQrtQ/87hobh/b78JyQx+j8vYowBEgjUNvmy4AetEBT3LBe5YDSp9gC0yf9FlQRycL9qwSOGFZXxb3GZrN2GUqEupuJtGz4IUeT/BG1XO2/2YXW4IQHfi/I8k6TUxf06aDJ2PWKc7uzXU/cLG44TKrDXunGeA8zS/iEYLMMk5kWLpUMTaxbpuB6gErs9sLrqMJ7GYBKRtyQA3wVyI8jjH37vtHyCO91RmQHXnVroOC9KN60PaT9+HkNVJVvUL0pifebf1K/nXL4XFT4RpvyUb3QQMZ4ZW/q7knz0LThD0k+jsEWYRIbI8JDzc4+Bx/dmco+H2fZF3nUyYNgNu5g5juEHpkaB3hY4kgn4EpOa7gFC59nBNZfhE+YXoL4j10/GCiGf250zIy/off1283Q1yjWWnLr919aAz0Fl5BmQtw5cBdY9KKmjyAtVKmm48KVhyRuPsl6sDnwwSur1OFg3W0spL0fIHcuZgQ4PqM4QpQf32+3uqMbzjyKuvYFybl+5ptTohvmQ==</encrypted>]]>&ImportUserDefinedSetItem;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70E9JRDE0BaGNAK1K7L3eJyrYTeJ4xp703j8AD40WEqhJE/9XDF79GtCdNDDq2DDUtRMBwluxGgHcrh8pQzc4IPvM8IWFoQ8D4b689SaMxePdSoWe4NFKEAKqlvBK19/sgCR1lCAedGsZ2atm/OuD/4Nd9OSkDwMqim7Y71takhFR4nz6mgFnRwATnpoEnZncsxTJpRwObTKd/lhaTEtsmrTnS59OiWJk8bL05409TyufTu0FDC7gJq3EJiAcZvruhyRWG/WrWefS3qWecGnm9TW7OblRwP4Qb4TIDX0grdpupWNHf/dULj0F/315VXF9PDYxgdQl4mKz+M41Pg3ikSYM+VWEjLBe9HU6mOrbGwHOqbeimTOdJkcYIH4qz8+gMjIZhZ7nVhKz7gOzQbRlI6dR10ic6o11opYFZtuH2SNeC7ouOm+2zV9mfaqYbT5RxPHp5kZmjbjbCYG9HBfKlTuZLXE3JFXNRWdVbzVrsk2gGwROqk11SzsQOFZn6qqeTE0hjIqTs1PKUCK8G0AWEPvaFEmZmot/eZQ23r8QvMMwBts7F7AAZ6+dXIuYlzYnP7j5RmHHLl8139wYXKKu++NIP/IdXZWpKSeG/GsLP6VH1Fnu3eTAKA3Ujo5xzwvUTMM3byLGTnKSPz/GUbWUWfLFFn2nrs2Q4hxmGV+DDgYtGyoagY15Ru1PISX3A3X4cw/qHg5g33pvrjzUOTOBm1AHr2B9Ec9fU8CSbTv4agyateyXzijhVOK/1jFBM/u2WS0cv0ZoG8ofuti9D5GboBSUYTUzEfwwyn/fnulZVMBUo6ioVLYfmAXW4kcjweoWGWo0JPITJfs3l8w9M0fPzX5WYUjxnovW7GpTvQNNgrUQC5ujY5ZtcMjPTU+a6V0hJ3otGm7g2Un737wiOHCwvHvBrYJzIB4eSg407H1x8SotgXoH3vQ82lglKemx1KgvBtazRDwG/YLr92p9EgutIilL37OOjNQ6ZmRXR0fWK/q06JN4YumDRMXkDcI+YudiLzXh70QSfpTJy9dhjjPm3So=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>