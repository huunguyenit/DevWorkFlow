<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Controller "FieldsDetail">
  <!ENTITY Filter "filter not in (select rtrim(a.controller) + rtrim(b.field) + a.field_id from sysfreereadonly a left join @@appDatabaseName..syspostfields b on a.post_id = b.id)">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vsysfreecolumns" code="id, controller" order="i" filter="&Filter;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo sử dụng các trường" e="Add or Remove Fields"></title>
  <subTitle v="Chức năng: %s1, thông tin: %s2..." e="Function: %s1, Information: %s2..."></subTitle>

  <fields>
    <field name="id" isPrimaryKey="true" width="120" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Thông tin trường" e="Field Information"></header>
    </field>
    <field name="controller" isPrimaryKey="true" hidden="true" width="0" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="status" type="Boolean" width="80" allowFilter="true" allowSorting="true">
      <header v="Sử dụng" e="Use"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJQ/BSbgQreZnW6FL10x89QxGrxaKj2Nb8RCk/RZIEN2A</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz6ANypeMQB3Q2Quhewc+cLcIYxqCiVTpuRnVCYWB8tQJ</Encrypted>]]></clientScript>
    </field>
    <field name="post_yn" type="Boolean" width="80" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Nhóm khi lưu vào sổ cái" e="Group when Posting"></header>
    </field>
    <field name="style_name%l" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Kiểu dữ liệu" e="Data Type"></header>
    </field>
    <field name="header%l" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Tên trường" e="Field Name"></header>
    </field>
    <field name="width" type="Decimal" dataFormatString="###" width="60" allowFilter="&GridListAllowFilter.Number;" allowSorting="true" readOnly="true">
      <header v="Độ rộng" e="Width"></header>
    </field>
    <field name="format" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="format_type_name%l" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Định dạng" e="Format"></header>
    </field>
    <field name="round" type="Decimal" dataFormatString="#" width="60" allowFilter="&GridListAllowFilter.Number;" allowSorting="true" readOnly="true">
      <header v="Số lẻ" e="Scale"></header>
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
    <field name="allownulls_yn" type ="Boolean" width="80" readOnly="true" allowFilter="true" allowSorting="true">
      <header v="Bắt buộc nhập" e="Required Field"></header>
    </field>
    <field name="client_default" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Giá trị ngầm định" e="Default Value"></header>
    </field>

    <field name="type" width="100" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="i" type="Int32" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="controller"/>
      <field name="status"/>
      <field name="post_yn"/>
      <field name="style_name%l"/>
      <field name="header%l"/>
      <field name="width"/>
      <field name="format"/>
      <field name="format_type_name%l"/>
      <field name="round"/>
      <field name="order_type"/>
      <field name="order_type_name%l"/>
      <field name="order_id"/>
      <field name="order_field_name%l"/>
      <field name="allownulls_yn"/>
      <field name="client_default"/>

      <field name="type"/>
      <field name="i"/>
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BEUrsHZmx+y8q8fzOBo+Vnv8PO4xvoTxUmGOhQ8/6qSf2swA9avTaS6Lz/dzGFReUmQDsxZdGji2EknplCtk/PcJ1zbND7Gp3gMqCp5n9IkyVWeuNBhE7lZjhjQDE1NTaQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BD5BADbC62uxBFojT0TLVY76gBdMWG/QKoDr7qIL/KHfPTSdX1lmKuG8eSVxrzZl/hxWeJjyvyb8R+TpmJT/aRY=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJEgTjCN41P0qmtjUnxxg6ZP8kmNu5wlQqNAEUrfli2m/5lVHaZSqPW+j3nO+7C8Y/1/uzF9HYOZV7H7ECskSIs=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCc188LBDxvAuuuzVL+YKg7anJ+rQAg1uNIGkaoa/PpJF1PPE9AQ4p1OyufxyzU8D/0ljeTsVGMBFBVesaxSmN8=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BKIZALLEdYt+SnOJ3+qjYT6t1941PQSxRgtrkHpcy6YuZZoT9geqbeLIfDk4OrgOKnoP5MMqqUTnPWW04xp8UJs=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BFcmQOrsNzXHQ3Ip3AGFT9czKU8FWsY0magh9orIVrhROoNOQ4u3knXmGcdojyHl+Vz4wapeCDbSXmbLDttX8sI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCc188LBDxvAuuuzVL+YKg62g2qCUo/hU1hcVV6dE06eGwKDNzSlaYLQxQnHeqJ3BXfzdWveWDqXo5Ea6EM6yHFO5X9w41sGF8j0B/qsd11d</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJEgTjCN41P0qmtjUnxxg6YLEtdV0MHk5bwR0XPxS1uDAvJYqX6vWs153oTEgX89e34MWShStxsfdX6ayLxU86qkycZSZ8IwwKryh1JB3TZu</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BK0DQqVC/JHKctymwoCwAQ2smmMfHt2bOt6cxyQsGsd9B+RL0kD9MjfCfMX7nZDPaeJZNWNtjYNxDpI6NykeXLc=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz49Ljqmuc0qIlUIt+ySTNlbAZX4eMzedOEP5vi4pz+merxgmnijM7OHIKQhwqq8Igu+BTgVhlOKcYGYXJ67Jut9DwQXS0vTnAicoCWMt7lK97f8a5GyRSbIedDq06xQXf8CffadVjRuS3Dtf0pimmAcZySBIeNgD2dM6+PgCdtrxML4a9+h7UnjSRW7b9AHRv9BayVp5j4LsqRMV7spwAfXjgVj4A4bzsbed+HOuAHR/fCUF3ZiYsv1SKUPFEt8MgA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BCc188LBDxvAuuuzVL+YKg69r0U3onXsnXWsLTBTE0EE4PafwhRlVfc5t0Nb6AHs+saHKMC8TAAl1paSxLW3VPG4rU5jwT88icmhjAWdnMwwMOXdrqH+bC5zEh28YP7k1DvWUpW4TbuCipgZFJOvDLUy1FIWffN/+0+v3yVmQRYVnNZMPukvtMF2Jd9uRZ0YDTPvVk4Ii4nh+be2SafxclG8K6DhIysaObqACXqgwzz4U+0LH9WDSn3Kt/MhTuAI4ZM0wrOTIUNgD5jKBaoJ61uyYg7QI2B+1n9n0q3MvCcL+OTlFOdBsW0+GqpD2h2PHcsBlMG2gNKKxzlm2wRqWiqjbjv3HXKWrnAl/vvp3puOJ0oBXq8A0Jeq4EQFE/cg5P+EoGQGWpAZEhmqzntFIixPS5IakR42rhba6JNbesOX+ZqnqDgmQLJwwsOdGVZSaquazvWDo7iNJDqxYxDWHTTZKQWfdBU4jBGiAWlyfS6NggGOmX9HOrfTTQg1GZWJtBGpW3lJHEUPvratgPEADAbS0Q8cx015IWvWQq7c1+yKlXU6Sg+KDGvzU6qlQB03OQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB8q12XKEIvw0xA0/fPzFZLRllqigOf7xFvi6qj2z3cCcuzKBx6w1fHGrzBJ+i4nwc7H6g7bixDrlEYnDkm1YKg4Piy6tEaefYXbRsmD99g+UxceSMFDAS7YFwbJB2kt4RA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJEgTjCN41P0qmtjUnxxg6bmpowyy5R99/WUczOvSOdVfUHionymmCKipZcSnasXlJLufd1DRqMfd99MW5JF7CLtsy6V3LpZf+u6FPUj5CXq1ghLCmgMxW4kvrt8HvpWrM5QbjjtWiLP9IrtTX/E9nyL9ysIrnewkkpHtqRD4H9Cy1K4ZXdSVOnvi+1WUkFlSszVvuklUhW3Qxwf4dkpURqGQRxBoOtE7qVbBcvHkaVMsC3iO14g8+Xxt1KYZIFUjni+R/L43PYrwD3iaiXJFkPrjkHlocBQzpQ52Oe9UDL4Kh+LAqPzTQE7SZm8ta1ILg6CzZRqj7Y36kc4gwl6ibXp4OYZX9B4+LAYeFJQUtZC4/VFOLZc0QnCuiIcA1UjmQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&cF6rpyP1TAzsCniwUZCGB0+pPxoaVlGwvy8c8BT6uQP6+Vod2X+T72lFRyhJ9R6pWswmQoQ2DDIz4u70p2dFfruGJurg694XYOm7UbmxMIyeX7cVxGijSMFLeu4D6kiU8YiB7r0lvb1t5O78WGjPLoBYznyYpRpMO2+cysrQgpwKSqUwqsZGEJt1zQ1vSlha5XwlSPwLk1OPIgAd1L+zA6UZbvrRzXp95tShJsmoG112/Ng0bj786A9yPsvxGn+K35nFOhe/WUi4SqVXewO64BooZ2C/XB4HMkIsNNDDCo34bHOTxyeqD1FNA/92KxglFFbqy5SkCEm5VR7lf/YJitoc/mUHM2bU8paZ4gDeh5SV1ZUhynULG9v6j+vyfiZnnYM64B4n+YQ8Zgy9WVX1q+9vAaByAwJrNNCfSW6w6oCFp4fVMnE7TAHLLojMm3nGShtfsG8Xl51uErbZIlFF47SAX6Rz2HEKk0rve7ltbhU0ZTxfG31msrrbX9soLAnI8m/2OXX5OR82AmN4vmqd7ZHReJ+Gx2Ob0OoZVsoIsiGak9uTrzip0glvh8UE30QMoHUkpUlMvspcvKy07Q4LzfBCdmsI6/4K1s2mzqDj5BB54nxJgj/vE9GxUCxBNsK7hORsvpaFCskbXku6EFf89Ro4hJW6KwuRfFILXZNw+jTpr3W8Fo+zFJw2AR0J801P+ujH/y49Y1oFzO4d9GU2zgpMyitY7xWZvqMLX7ITy5Z422Uzwq3HaZ82j0G3JfzmgeaH3lAl8T72XVXLe6egzA5D/fcL4E0pZajBQwz6t/3aiY13tLTmW/5Tb3ibKjuD9ostSelG7/hcyCnb8xG0c9u56RicL4ZbJo/z4SmUrAJvo3OJjqzbQrUykCBcNRmWLB8ZnWvm02YpkOHU4m4Ceg6XLo0TpfCUqJV8KMTqyD2XoHrY45gVdhKtUVH0U9ry61fqQi2rEEVtuk4y4iEwv4CfI8nRC6IQWLR1rP+7JczjdTlnDvDdVtBvryUThxvPuDs0QOYpqhIdaUf33wcoR0Eds7UncfsL9NHGfp27ixR5Sz6mvF8khtY5BJs0FzJ45DZlmAV5uC4aTHlD8q5+ibpHTm4KILn+PAictVqm0JtdvJTOC7HbsqznI1gfENfa4ajIpGtdv/azl5+AU0fld31eFcBEzUY/0h80uRGHbOhbrfRmVqrpn2E5Gh52RBmgxJ8tHYH1gj/lOUQmRjYz81UGnEUzaYHjcqMS0HavbbHXDdBOehrauPAZyJOAWx6T</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BIihgTsIGV1rXKK1LwoBCSBMKneojYxWVcFUxpUnUJu365N1vLFN1J7erjylhJNPykTPBUOFwuUn+Xgdue5Qf9RdMAiOlp6Dp9L8prUapZqtfxkxoq23yJIub9LnrXVv+cJAFvD8FVTPJ81cQgOwDw0o6P64TW7OldZ+6P4RKIBUVSY8X2PeQ2MDigoX1MA2zYiWw7dCrM6ntbzygZV8/es2QPSiVYuTgUuWXRVpMOfmy3lxTp6/UEr2JuqwIAdL6czhp0wxBcvNZy85gialSH5iZcZ28PN41zsTdUwMr4x3FgZjc/nVJIB7ZMBHXERSIcJrdjQqGy8b5I1GvS3qhRWvX20CCeujGXoT7w1HABAY6GOdYwie7mNtXCdJsHwYfA==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwq1nAWNtNlle71KnkFffYNZnNPn4FIF7fgOQVK7abeUprgAwRzmTQP+xIxzcsPP2H9rJZa0EQQRvl+oHDkpcU7DZ2PFSHxjDLHH5pNaWsm1Yu4Dr8tz06mbozSUIbcsJKMAcjStWlkZVOn1f+kfyccQ6wJd+1T4BnLtfzSQSAmIGqx6/lSPhoU1Y2ay/9bJBnf4ca8WqcCSumuhPHDC7FkA2i/pQ03xTDtMWRkPNaZDIqNvTZe5nG6pAkuYIhSrjSVNUfgezgpie6mFo9aJSly1iZBphBt51TmfvhhbxhNXiN3SjgYyhotw+kP5m57x7USkfGqHKYo+aVBffsUbvfnWkKgY7orAD5E/3g0ufT80lLv6M/NNJ6/s2NfZzs5pk27c+YxtoTwFTgzIzQGxzjgXLAdfRXbxuHOYmo3Wjqf3Ks0voK8Rlqept6ggWYLcLEsDii87hIfAy5UvDx3IctJDFkLWYEvXTK+eu0a12bEFzIj54U0L/57rBQmbAfY/G7mPRpH7Q0LBWf8j/XyvCXJbH8KhEPFQTGWfVlAdEt423yGuOIujMD7vIHv6OBNU74MyPyiEIlR0wBOpjSk1eIaIS3MuXVBUcUVF+3uyk/gVmBw9bL7npA2WyUpKhLWQotCBt3G/L0kVvlxxFurAPnHi6G4CpmbOaY65647lf07rEsbygrLOI1GqWFrivAQVX5TmmP8frkzRcY64WfkuT2TeEI+fbf2RXyTj+0DVOAILHKYFTC6rOGEMAvo/o9oIsYQfhDJFaHNy98bvph2ozzE5IBzNkNwunEq8yauK6Dy/wlTI8RVs3zKbukv6ltojhmH2tjXZpjdPWIpFCVsCYfmC1otg/QvTtald1xqVg1V7GzF4hnRuxTxZpZ0keBg5RL4drWuuwlPdiK3OzxRkSwdRStanF0aei6u1RKOp6TtXASMqPi1m4ov3jPfD4WYxmvZgNWqzzm/bZcsOU3lI7L3VikBjRd3HPrS+MfiWaexpS3JO9l1RDcxrlu1kqngyCE3Pq6dBGp7CXGlPjKSqsJ5aAL+j/vu+XEOkYhR/xS37Zs/A5NIa26iCYSE68sFoHxbb3sNVYiTPsmVjBN93GYSrV951y7sh5unSn4u2ZZI9u5977W5yzUEjovHKNxCa+MtzfD7Mprb8OLIKUDQX6hQOgU+/dqlaPqdMIExy3ey6KDRv0x9Wl9Sw/v3maNM5yOdkyMMkmTOXdUsKxDy8fgc=</Encrypted>]]>
      </text>
    </action>

    <action id="Option">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0h39voMRMfEPMsR2CWXs4O1/qas6gRJbkk2oWaliB6dpZOH0Ek2eBJ8d++R7/k/y9rWwofB4eYWrHIFFXHXhr4IUeBWUq5vNuSnql7Do2NOnfhDKy0sFoFaWTJK5CJ+EHwehqljAK4DKPmQmXiUNRx00OO23+1TXX0vWlMBHJjTyFD1hzawEbE8yoAa/pd0VvhW5taebd5kdPNEZl+wmKp8hiJphIfnMFupzETBNjLaE63OEadtUd3w+zGzgNlmEIawlxpHxtOxzrQVfXAs/SABOpUxrBNNFrSm88AEfovWwAMjZI9LmZJcjtrUJ2SGZly1KnT2UH5o0XAhdaceeEBjJPMt+EUK4wqJHsQr1E1U203NLelm+8u/fUvY4O4CMKoYj5u8SNXGoJXCS4HYPSuv25OVYIt1mcINtSMyNZ5GAzIU9sH6QF4KudqgN2M0b3oIHEcK67Nqy9GSGFZ4GK4r31ubAXpjzGHuF/ibSRqKQ6INcUL2ZsIoKtP9S2P2EVrs8Jnii1OY6MuNhcRqdnXQ084Qb4CxWcCRk7nTjkjG8oKHDqUWOCDHdBnb/yv7a52EXYdRgKfbbdxHk7vDJioREgId4fuSjUJmpaRhByrxt/1F+aEshmwZ5xynQtXpqQSz+VGRVugWvoWjf8SJmzOuNU6jxxtuo+UPXP6XMuvGhBx8P3waT+aJTCGlDGdirRF6ARhaBG4BIOgqheGpc3xPw++OBWMr6c+kUCMOxJRArtpZEJ84M8g2T2JLmcOUD6BRFEooAQzLAcE2KaHtvGszpG/xF3CAGAnXSwX/l2G8xUD1pJXa3h9A9C/z6mppoYAAxKldXeRSc0fNHlKdn4YN/a1Xzw2t4VH+MXYeiM5tzZyIMDjaSC/1y9HGo3ho7u0OdFQXS4teodhmfBcZOQzL5GEpdpZ0DFuvao5feadWc3nSL9FhdBpuSLm9nd0ILZTtHSHPlep/3YvnqcqD6X6mpiIQseqYHb+1036tKJ+yAOg2/r6whk5fkSXa+ii/lTMBiG7kxDJKsIUTBhXwesz3hL8CgVBdXRLQ5lt2io5w2R0MMB7uOCbJr6wK1sCzCt6yOB8aCbU+YRuf7Rek1AFG0qP2kSmLkjFWUskAalG5h0SIOHhgt5L0f5pHbSsoTbcOC57vTpjFoZGRtkIpExrrAOMyhf8vnGPtaghyMCDT3NVjY1YL4FH6PLm/4Af5nSk+OueCYzsQX9BDZOjezJrY1qXFBwZ59rx/PkU4GzplauGY+kU2rLwcBnwDl77g27kpMM7ZciokkFPRMIfx1wNbzGJjj+lmsnLZxcXJAMKcW4zQ7ECF4C0QSnJP+Swl1TLqodSKqngQt4OIh+rYGx3nFTVZxaIJcfPmpntTk5hDDYu/alUFYkpJrVABZITripHJA1J15hbYZ5vaKPx7HxmkZ7BzqPChHLwB4ZWqegc5eB+cs7u8ZZ3oA+uzZ0ca8QTfB2Y30KbDarHrM0YONUSbOfKRUzkbiz1Mk5qS3hOgn/HZb/GvqpOKrfOFi9CCI8p46dPd9waTabEYP4wqBHJDoP/9TzP5eL+biXSMy1U3qg76RFqNuE8ERkCYeRHiXeHjmopHySCaaXVcNQa1FSAX2koaGNNPGnQ0hgw3L4QxLX5pWDZLLSPzz3PiWpvLgxZQ5nQqMfcukhTc1x0d9B+2E/FxmnFCeKlYVHJiMuTXn++FEukbpjQnJj0R70XhgdFxqfTtMnXWkyrIfa4OAllDgcoSTAauPRUeB9gqi8DeNICPuv1Bk6FlpiS5Dx4vP84e8Y6jqvpYjd56PYX/dhJZS8Fuw92AHT4Sc9ss0eHKuw==</Encrypted>]]>
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