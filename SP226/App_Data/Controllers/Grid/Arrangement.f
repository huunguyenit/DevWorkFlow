<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Controller "Arrangement">
]>

<grid table="vsysarrangementcolumns" code="id, controller" order="i" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo sắp xếp các trường" e="Arrangement Columns in Grid"></title>
  <subTitle v="Chức năng: %s..." e="Function: %s..."></subTitle>

  <fields>
    <field name="id" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="header%l" width="120" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Tên hiển thị" e="Field Name"></header>
    </field>
    <field name="controller" isPrimaryKey="true" hidden="true" width="0" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="order_type" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="order_type_name%l" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Loại sắp xếp" e="Range Type"></header>
    </field>
    <field name="order_id" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="order_field_name%l" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Theo trường" e="By Field"></header>
    </field>
    <field name="status" type="Boolean" width="80" allowSorting="true" allowFilter="true">
      <header v="Áp dụng" e="Apply"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJQ/BSbgQreZnW6FL10x89QxGrxaKj2Nb8RCk/RZIEN2A</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz6ANypeMQB3Q2Quhewc+cLcIYxqCiVTpuRnVCYWB8tQJ</Encrypted>]]></clientScript>
    </field>

    <field name="field" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="header%l"/>
      <field name="controller"/>

      <field name="order_type"/>
      <field name="order_type_name%l"/>
      <field name="order_id"/>
      <field name="order_field_name%l"/>
      <field name="status"/>

      <field name="field"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIkDam2OpJKeUPrZ6I5WGFhnaMdP3TwDZh3ymfnifRK0</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCFFW908r2hZG9WaeHd0N3X7ZCFOitHeFmT8S/i7EEImU+xNYwnaN1XigoczZn26BA==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMjEitWCiBAWcopg6nypxirG22kVK4Mqm3+MnWVjVq0Q</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCFFW908r2hZG9WaeHd0N3X7ZCFOitHeFmT8S/i7EEImU+xNYwnaN1XigoczZn26BA==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMq6Xh7xds9o+3oCl00TufVGLE78mW1GUKVnWVD5XSrl</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCFFW908r2hZG9WaeHd0N3X7ZCFOitHeFmT8S/i7EEImU+xNYwnaN1XigoczZn26BA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BEUrsHZmx+y8q8fzOBo+Vnv8PO4xvoTxUmGOhQ8/6qSf2swA9avTaS6Lz/dzGFReUmQDsxZdGji2EknplCtk/PdzaqsJL6GRRKbpfk2vhmTtb8Ne02DsmmJb3HNVMmZVmQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJEgTjCN41P0qmtjUnxxg6ZP8kmNu5wlQqNAEUrfli2m/5lVHaZSqPW+j3nO+7C8Y/1/uzF9HYOZV7H7ECskSIs=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCc188LBDxvAuuuzVL+YKg7anJ+rQAg1uNIGkaoa/PpJF1PPE9AQ4p1OyufxyzU8D/0ljeTsVGMBFBVesaxSmN8=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BKIZALLEdYt+SnOJ3+qjYT6t1941PQSxRgtrkHpcy6YuZZoT9geqbeLIfDk4OrgOKnoP5MMqqUTnPWW04xp8UJs=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BFcmQOrsNzXHQ3Ip3AGFT9czKU8FWsY0magh9orIVrhROoNOQ4u3knXmGcdojyHl+Vz4wapeCDbSXmbLDttX8sI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCc188LBDxvAuuuzVL+YKg62g2qCUo/hU1hcVV6dE06eGwKDNzSlaYLQxQnHeqJ3BXfzdWveWDqXo5Ea6EM6yHFO5X9w41sGF8j0B/qsd11d</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJEgTjCN41P0qmtjUnxxg6YLEtdV0MHk5bwR0XPxS1uD9DPacWCTZcMamWsobmI5hm8qStQr1rGI8pB+sGYzPWsf6ZwG1dQyhOjuov8lV8jL</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz49Ljqmuc0qIlUIt+ySTNlbAZX4eMzedOEP5vi4pz+merxgmnijM7OHIKQhwqq8Igu+BTgVhlOKcYGYXJ67Jut9DwQXS0vTnAicoCWMt7lK97f8a5GyRSbIedDq06xQXf8CffadVjRuS3Dtf0pimmAcZySBIeNgD2dM6+PgCdtrxML4a9+h7UnjSRW7b9AHRv9BayVp5j4LsqRMV7spwAfXjgVj4A4bzsbed+HOuAHR/fCUF3ZiYsv1SKUPFEt8MgA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCc188LBDxvAuuuzVL+YKg69r0U3onXsnXWsLTBTE0EE4PafwhRlVfc5t0Nb6AHs+saHKMC8TAAl1paSxLW3VPG4rU5jwT88icmhjAWdnMwwMOXdrqH+bC5zEh28YP7k1DvWUpW4TbuCipgZFJOvDLUy1FIWffN/+0+v3yVmQRYVnNZMPukvtMF2Jd9uRZ0YDTPvVk4Ii4nh+be2SafxclG8K6DhIysaObqACXqgwzz4U+0LH9WDSn3Kt/MhTuAI4ZM0wrOTIUNgD5jKBaoJ61uyYg7QI2B+1n9n0q3MvCcL+OTlFOdBsW0+GqpD2h2PHcsBlMG2gNKKxzlm2wRqWiqjbjv3HXKWrnAl/vvp3puOJ0oBXq8A0Jeq4EQFE/cg5P+EoGQGWpAZEhmqzntFIixPS5IakR42rhba6JNbesOX+ZqnqDgmQLJwwsOdGVZSaquazvWDo7iNJDqxYxDWHTTZKQWfdBU4jBGiAWlyfS6NggGOmX9HOrfTTQg1GZWJtBGpW3lJHEUPvratgPEADAbS0Q8cx015IWvWQq7c1+yKlXU6Sg+KDGvzU6qlQB03OQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB8q12XKEIvw0xA0/fPzFZLRllqigOf7xFvi6qj2z3cCcuzKBx6w1fHGrzBJ+i4nwc7H6g7bixDrlEYnDkm1YKg4Piy6tEaefYXbRsmD99g+UxceSMFDAS7YFwbJB2kt4RA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJEgTjCN41P0qmtjUnxxg6bmpowyy5R99/WUczOvSOdVfUHionymmCKipZcSnasXlJLufd1DRqMfd99MW5JF7CLtsy6V3LpZf+u6FPUj5CXq1ghLCmgMxW4kvrt8HvpWrM5QbjjtWiLP9IrtTX/E9nyL9ysIrnewkkpHtqRD4H9Cy1K4ZXdSVOnvi+1WUkFlSszVvuklUhW3Qxwf4dkpURqGQRxBoOtE7qVbBcvHkaVMsC3iO14g8+Xxt1KYZIFUjni+R/L43PYrwD3iaiXJFkPrjkHlocBQzpQ52Oe9UDL4V7k1eYzlrJYDyqY8WlxUJmy8I8pESvMXEc0ZBLBzmChscydefuZm788V0qqpmhTi2AVTZ23tin4VVnMsQX8MdQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB0+pPxoaVlGwvy8c8BT6uQP6+Vod2X+T72lFRyhJ9R6pWswmQoQ2DDIz4u70p2dFfruGJurg694XYOm7UbmxMIyeX7cVxGijSMFLeu4D6kiU8YiB7r0lvb1t5O78WGjPLoBYznyYpRpMO2+cysrQgpyvAu6UEbA0iTiBa6i4d1myJwxUCEZUD68ILPvLke2TtXl+AWOVAsI/Da8tyB8a2hBfQgN71GUej9Jgjgx7by5ISdAyj77Bt9f7F9Dm68RbzgVrkncjuuQfX8qmp9JeETqST2HpxmEP5zdQBWHd4xzop7u+0hu7Ff/K0FSoQz8g+gwipVILMiTNpKzw3FNTgmqInmGUThnIG9L1zyjwz3P64g0fzMQHiYMhmegftVm3PpRON1FHvIvylZ99+bX+SBou0ZN4LZ4gh2vNm3T/R0xyrvaoZVfLCvNorL7IQzK3VHZYFgB2ngP4e4JDmPCozgk/NW83gcIziCn0gBFKEu10Mma7I/weiEDKrFWc2BpmuSzryuows+BTTY511E33wcrJlmg4CrzaL2ufUZLJd89QBBlTfToneUKUGD66owio+Hz6Ocy5wbrBnkTo0Tw/OgACTpw8xywZwH3HUT1DtqIA6+8MUGUheQE4zzm8TuYIreg28vtj5NowGu/EaM+yzBgoq2xg24MsxyptVieiZW0Yb9S56hbjLAkEv2/QpfxsxOLjk2Z2YH+D3CUs7EqHhDuofxpTSLvrgWEWSIr2lwJxq836EovP9i5wUC7QZuS8gv4YMUmF6T8ZSdCyKeW4PGDbsZW2lmXIjE97E1yYtGA7VjIJXAzgS1zEc0Q1npyRXuGXpfph5zfXod3rTo/WUqNoS2PRP3/iGhJdHUQGWlgjS5h5EGi+GabnEfafElYXRv/+Tu1pMjAQXvPvaSFes8+L0cmQjDlOdK6XesDlkvbkziGx7kcsrrC4UPUwlGTYBR2qdIWxjT1sx+XoseV6dgU=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwq1nAWNtNlle71KnkFffYNZnNPn4FIF7fgOQVK7abeUprgAwRzmTQP+xIxzcsPP2H9rJZa0EQQRvl+oHDkpcU4df0o4p1T1qfI0ekJSMPGf40k1YSzBe1ZMLaSMoVRRmovQYSnU+CQUzsLmjPZ5gvdP3zOvyeSRP+9vCs+LlIsWoCf0OeUr8DrqVQsCyi/nhGrtNONG8aGJjgCY0HmNalT0QLtl1KFP/e+ELRo2oD5REBRg0EumiRZwQj2yneTfU6ZsxbmA07U2KEbc+1+h7ys3omwxHuikcZrUUPrHk9yki3Lf1hBLNMAcwpEgJRmPsn0W0u7TZQ/auJcJ9vZbMtqhMJwvg1ggU/UWfVqoab1a9JJHu3guS0XQ+KY8o9WDTUluQefoC7X6PaRJfA6DkgUlM0rV4n62ujsg8ZFwIJtWtVGexe9J2IvQTpzNcnJj+fzpamUEXCLsegE5SkIkE3hgek6Xdt85BrE9cYHro9bUGB5Dme+VWlZlTwoe1HGJXwoRSOkZt379dxNgF6IzmK1n0usezhhILvXgCIljBozIa+eLLHtOAptoNht3/4mJCvLmI9lZOeg4aTlDyLWN2+pSbwtqGvAJ2/E0KQvvknHKb5GmqS9VZJJxI2Q/jZ9Z8e1gc2F+jGppMaIJMjv+/pwGDNrqly6Pwd9dnjRaZt2L</Encrypted>]]>
      </text>
    </action>

    <action id="Option">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0jraWMg2iZQQdyT0lbc0D1N7tHcB2EyW0HYWUXMWI8IWm8jVk2yBpnHLnmtF3F46PHeKCejBa+LBJa9ktoigF620/7UdQcTPzNF+LSyCwO1UFHzYfdyhYN8+hMynBjN1jzUXqQYfN4J0Z7hIqE7Y/EEhNZPnjcfqevMZukb2LWNLQQY930kjAtjIc4jmMegxDAcUPEqzApRmMwy9c5BtWOkhRSJ20YQODysgpig85SZUh0CX363+ya6ab4ZTH3wTCt2B1VZIxh25/IW1w+OT5+lKQ2ksEhFTzF++WNA9/qHd/MQuWDnMrRDKyBaOcJhznYZvChCWTryFLOrDuaiHki6Zo0UG/R6oMQ9+8ZoZhauNojv32l6TWUwZElPxJJKfwhs9M0WdCAXudhMiMYr9kU1gSE+dWvZR38/EWBWXcdko351v6UFqm5KtnRgToh9P/XyFAGcNeugEDhUEkpSc6ACkQZ/ITMJRZ2effhA9moSLmuOkjxxjuBPuKZfQFV9kxIS4E7ZoGb5vloQkF38hVLS4Ab/7JmqhQ/ZTnos5edhiEFzoZPLRkoS7/rF+ZF0fK8SzJMfXH7ZAxxXTzTaw/0IjcsLgGJag3ZgdxXWUE7K0icP4M3m7Yok9vmaa5tP8OhfgTQbzUOELZqX3MqPTEqhr+vKxA6mIQw5maSHRIDSF2oSL+j8H/wN9itwO3RiZ42fK+7WUNBx+RvZFgEsPS+6OiRzM1rnTAmH5TE/booPZew4Xoqtt7kl9Uz2OcEWW2WuTYNFgfmG6AeJr0H3XkpDRYuh0V/oNAKX4Vk/CpGqg0iAK3y93EnNujhJh8pErHA=</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwNJb7NU+Jv72TBsR/SB74QH6a//Flg9ThtbAxKXedJeJ88OOstDPP2iUxte5HWOgS5N0ocLtsUBsyksWya6czYAqcC4Ty1PsWfAbD7nx6BbFlw0WyHZSzRavi+jBwhcLd+tm8xUsCuyBqxnUZMUQ2ZnYC8IhcTEg+P0h2EIgS+Qrwe5H/U5ilswPjcS39p3LA==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Save">
      <title v="Lưu$" e="Save$"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>

    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>

    <button command="Option">
      <title v="Lấy giá trị ngầm định$$90" e="Reset to default value$Reset$90"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>