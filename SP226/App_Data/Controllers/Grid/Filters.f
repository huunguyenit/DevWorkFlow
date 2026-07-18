<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Controller "Filters">
  <!ENTITY % CompactMode SYSTEM "..\Include\CompactMode.ent">
  %CompactMode;

  <!ENTITY % FilterExternal SYSTEM "..\Include\FilterExternal.ent">
  %FilterExternal;
]>

<grid table="columnfilters" code="id, controller" filter="hide = 0&Operation.And;&FieldsFilter;&ExternalCondition;" order="i" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo hiển thị các trường cho điều kiện lọc" e="Add or Remove Fields in Filter"></title>
  <subTitle v="Chức năng: %s..." e="Function: %s..."></subTitle>

  <fields>
    <field name="id" isPrimaryKey="true" hidden="true" width="0" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="controller" isPrimaryKey="true" hidden="true" width="0" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="header%l" width="300" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Tên trường" e="Field Name"></header>
    </field>
    <field name="status" type="Boolean" width="80" allowFilter="true" allowSorting="true">
      <header v="Chọn" e="Select"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJQ/BSbgQreZnW6FL10x89QxGrxaKj2Nb8RCk/RZIEN2A</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz6ANypeMQB3Q2Quhewc+cLcIYxqCiVTpuRnVCYWB8tQJ</Encrypted>]]></clientScript>
    </field>

    <field name="i" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="controller"/>
      <field name="header%l"/>
      <field name="status"/>
      <field name="i"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIkDam2OpJKeUPrZ6I5WGFhnaMdP3TwDZh3ymfnifRK0</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BLlO5AIKSdaA0Qa/V0Y35Oo3o3E0up4DO5kck1J0B49nzPM/zt3Ucc6pi3VyC7qh3tfh8vi2/l6IVfCJSgZSKUz8tAlV/ut+shDeMH4891MH</Encrypted>]]>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BEUrsHZmx+y8q8fzOBo+Vnv8PO4xvoTxUmGOhQ8/6qSf2swA9avTaS6Lz/dzGFReUmQDsxZdGji2EknplCtk/PdzaqsJL6GRRKbpfk2vhmTtb8Ne02DsmmJb3HNVMmZVmQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJEgTjCN41P0qmtjUnxxg6ZP8kmNu5wlQqNAEUrfli2m/5lVHaZSqPW+j3nO+7C8Y/1/uzF9HYOZV7H7ECskSIs=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCc188LBDxvAuuuzVL+YKg7anJ+rQAg1uNIGkaoa/PpJF1PPE9AQ4p1OyufxyzU8D/0ljeTsVGMBFBVesaxSmN8=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BKIZALLEdYt+SnOJ3+qjYT6t1941PQSxRgtrkHpcy6YuZZoT9geqbeLIfDk4OrgOKnoP5MMqqUTnPWW04xp8UJs=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BFcmQOrsNzXHQ3Ip3AGFT9czKU8FWsY0magh9orIVrhROoNOQ4u3knXmGcdojyHl+Vz4wapeCDbSXmbLDttX8sI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCc188LBDxvAuuuzVL+YKg62g2qCUo/hU1hcVV6dE06eGwKDNzSlaYLQxQnHeqJ3BXfzdWveWDqXo5Ea6EM6yHFO5X9w41sGF8j0B/qsd11d</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJEgTjCN41P0qmtjUnxxg6YLEtdV0MHk5bwR0XPxS1uD9DPacWCTZcMamWsobmI5hm8qStQr1rGI8pB+sGYzPWsf6ZwG1dQyhOjuov8lV8jL</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz49Ljqmuc0qIlUIt+ySTNlbAZX4eMzedOEP5vi4pz+merxgmnijM7OHIKQhwqq8Igu+BTgVhlOKcYGYXJ67Jut9DwQXS0vTnAicoCWMt7lK97f8a5GyRSbIedDq06xQXf8CffadVjRuS3Dtf0pimmAcZySBIeNgD2dM6+PgCdtrxML4a9+h7UnjSRW7b9AHRv9BayVp5j4LsqRMV7spwAfXjgVj4A4bzsbed+HOuAHR/fCUF3ZiYsv1SKUPFEt8MgA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCc188LBDxvAuuuzVL+YKg69r0U3onXsnXWsLTBTE0EE4PafwhRlVfc5t0Nb6AHs+saHKMC8TAAl1paSxLW3VPGZrE5raATWQbEA5zs1E0xSlBMmmA/6qiF/5VdEVlSkGerjSLPo2HZ8uANKWWDDGGV4AM2/vnpjlN91+RKDPrtGAP3TyOB59K7FcjTi2fla8/+6sji82W/KeC/U+EZSD4JDpI6qe/ofEtZ7d3h05MHx9MIjB7nGBN+criqWhNx+98UvExuEV1mwzdOifQw98U5en7vftweQBkG+ePa/kL8rEqmY1vmmwbfnuCg26hhBJV7zeo3SHiTpNzChCRgVSc/hzKQ8cf0ITupcKZybR2JASd89TLNdMS20l3qA6CJFUgd3n85vFvgHGAcWGNztpSlVPqpBhDew98jsBX15x23gghwEr09poKU5K/ZcjFaO0swx8ajj9IHjefUdEAElaQ/z8Sl/TDMKx580JUByxvzlO+apQGYK1fZliKuMLDQGrD+b8plKYwm6eHu+2Ytf5xrCOwKEziY8DBUveo9MsqpyevBwaI9uoggcSycOGGCuy3KY7/fJvww31zm3tRRfEnAUdaoEcyN1hqpzwtnXvFo5SYdnOeUzxkKhPv8r3XoNYzcbFabOUV7ujQIQ5O/NUQw=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB8q12XKEIvw0xA0/fPzFZLRllqigOf7xFvi6qj2z3cCcuzKBx6w1fHGrzBJ+i4nwc7H6g7bixDrlEYnDkm1YKg4Piy6tEaefYXbRsmD99g+UxceSMFDAS7YFwbJB2kt4RA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJEgTjCN41P0qmtjUnxxg6bmpowyy5R99/WUczOvSOdVfUHionymmCKipZcSnasXlHbNVINMK+Z0q9PWQOCACvOPoTX0F0wTLHNOytsvNZAtKCp3fvA1IbnAG5oHYGpwPuT8D5nhkEO5C0oRdC4rea46FFnmVQQV18XOH8LTJjNeHdTU9Op3JYI2livI++skULuGaDowc18KrT32OsvbLNAO1xFYTJGc8ylQZbeDc/d9rdFCfF+ybsllWeVn9ddW7AEELCTFgg6IrTVYnCwjK3EILAlwCqZXbanTLyrjz640Tb5HPs5KhLuUQ02ESxHedwt2tepVKYjg0f1+A77yvD8gfiXUsk/vtVzkY5iOZXEWX4+gPr4kuA8hazSuA2B2ZP+MQVWVxXBZwTQxCrQfGB6SU+gfqA25SFuQxm4FgOpkykiXmAGAE8mYjYICQpLSI2YfkvPJ0VWpsLDBtig++D3phzxkWrMmQEJKvXXSMdTjVgS2RwqcQB4UtidUK6G+kP9i9hzVCgYGiy2qnlbUxIh+rEP63Pu2eHZAzRvS6BYzgH7o3O/LUNK28UkNzAkfuxqqTIskHIyKdDX6TwpXP6Cm4haF6AEF+eMNZ0esegljfIOC1UFTe88dIMNBzIpVUw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB0+pPxoaVlGwvy8c8BT6uQP6+Vod2X+T72lFRyhJ9R6pWswmQoQ2DDIz4u70p2dFfruGJurg694XYOm7UbmxMIyeX7cVxGijSMFLeu4D6kiU8YiB7r0lvb1t5O78WGjPLoBYznyYpRpMO2+cysrQgpyBBiehpEKG0hsSPeRyywAfVykdH9cm9XesPwEK2PkrJhGZyoK0fyYX8/YrsbUfoqX7/5VsJPxAysAEUh71ziTMZ8A9kff7h7tAFofdcFq/ZnYKOoBHBz5TAxbFlWo0JLIIpZYnWdnB49TAAizCluIGjk0wgygpz4BOPR0HlOkNiDlRwaE/gjKmUcoWpjvtuY/lOSkSy3RQ3LZH8HwolXZJoMYuQO9c8dmZLvoyfJi9kolNJ7gfoaPOoqZwwn9zuPvmc/ZcS1t+Y+0rkWtywLXLLtGibAmOvJS9JeS4lTF27VVfuW2r5L3xb4MEUEO23/g=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjzy4Ye5z++F2tzYpKlc/7LYcY2u1MkJ1eTKPgxXOhIsvUlEJL9y6YiLBWM+01fyVjZ5QY1C/a5BxlL4xeKCupiGzAtfWindoGhNp0NKoiMcLJH+pvkkIaiADW7OagMqc7eImNsYSQ3gudFf5JvbfvZGAAFxxoPUTXFaZR0cEUpov1Td1WFWLwgnzSPyfZmH2vfiahG3DRXEymOT6AzDg6zkX1Y8PQ6qlR3jPxg34PH1f3ONvHX/VxnMHdQXyPNPzSFTbAad2oi/fgCFeTc3jFJx6F20IgANKh12OqLLG+o/pSlRgVfT6Twmeh/+/okR4N+SojGydsJmtkH9vPdo7yhXyFomyRkdBvXv/PifYbueb+ZUa1W5dXjE0uDe0ieY/miMntp4bFoVK4W9FU8DihzAO2hqmoLkr9p2xAgl4+z/t5CCY67dRSmHlA5gQ6vh6ezJnjBLpEOWkKNj0gW0uKKM9IGAYZAoe35TwMaHl3kUZjxhm0aK3TXXuFZ7UCoNRi+wDUwCXpfz7f7+Lmf51ygPQQ2/JPOdFMv1jGlUlhOnyUUkfEzblDGRWZSJq3t55XzFxh6iyhJfTSmmG95+VlPHT8NHWkoyF59zyjgU90lSVRzIvaw8YSaf148nz48WCgbQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwq1nAWNtNlle71KnkFffYNZnNPn4FIF7fgOQVK7abeUprgAwRzmTQP+xIxzcsPP2H9rJZa0EQQRvl+oHDkpcU5EAUOzwps1DWtVSmunHOFWVfg8Tmqgjae+8k1D4agiIOQx0Fgg3x7eQdnh65++pRMHPp79YiXpQE7GnGaw2wLUYDz15jvBNovGPUp5pf3uNtAlDKkpvBhvR8NConJ7hyy6Lm7EoX23F/arSesIf9NneefknZbgARGVe6D/WCvSInkGUlfhRlPp2rdXJjveHnKk6Num6BEq+vDXY8sWnibQ1lJIHzF8vwSlc/55EljGQz2K1/N9jHY625AtBcTfejey8yCBn7jCRkzT34deTtXAKfCg3HKxgZQ7XgRL/T1jHxwKq7UDFqvqWSiOvTQn/vfvd2DOD7L/AYUvn+zL/dr/c8oSwRLw4ONWfo39GrWeZb/EI+Q3Ih/2EZZYxlrmId8lCS0LU4jUtUAu6XrgFAytZ+Km50zWffi1I8E0O2F3APzgR/+c7F0EEVxdXhppUUPb2Q5XsF8uz+SMzwqg04mwVqYyhC/zkDTSZOpYhjZdd3D3IhnGTz4vNef4JPGW0uVLd3Hb7XD3VXiH1j4+SJBq</Encrypted>]]>
      </text>
    </action>

    <action id="Option">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0hbzQu5ZDO0Fj/Q0rhTQfOFYYMZ71WUR8gUl1Q3s+HXVYknoNtzZqXvjScI+5j7P8fC5vuQD1XzlKF+toiCbkfar+gS/QWOEqkb4XQacyeVhR9OxXYdY6YH0kZIopTjYlbK73QeEWt+IlkNtL/LZ4zgRkcilHlS6Kx7TZX4+wNf5sm7WMAOqcZTmqGA8ktYwJwBi9l/zfokos7DyfTS8ecNiVKzHKVQZyq70op9ar0sPPrbep2KQAgbCTVnMkN0PlrH/hJtFpCcADnNB8UOWuxyohEdMYZvBTZoihWkABi/CLnIc4SMVJhRIXk4OBjl7Y890pMjvxMvqtPDh2fBlx0r8l21m3o3nQmtorXsDCI+6sW/wGOQfMI246lYRKrB8D6aBico+Ih9mmtTvibheRqPWKW6yrW45bqVb9iphty2cHJPTzgLPHGhXrPgyyND7ySV57YA2oepXWyGobcrdeGDginRu/ftK7jOUHi5h4tcFKVv3CF05oVWmH4hxUoTZ2Y=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjzy4Ye5z++F2tzYpKlc/7LYdlFa/OW7hIGbi58orRROxMK1QOVJvfWOTn05H/VfRymDAxBPbrxQqrIeYqWSOb3M9muHQYP210mY53C/fXoQw5fKL1Cd+5x/bsvAaicPFR+4m9+3VSssIDyrFBvZLRnkxQKo1lXc+dUzldKE7IarnV8LOjFuS0nXWmOCiwrMSgdg==</Encrypted>]]>
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
      <title v="Lấy giá trị ngầm định$$90" e="Reset to default value$Reset$120"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>