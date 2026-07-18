<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY Controller "hrptListOfEmpWithoutTimekeepingData">
]>

<grid type="Report" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Danh sách nhân viên không có dữ liệu chấm công" e="List of Employees not complete Timesheets"></title>
  <subTitle v="Ngày báo cáo từ %d1 đến %d2, từ giờ %s1 đến %s2..." e="Report Date from %d1 to %d2, Hour from %s1 to %s2..."></subTitle>
  <fields>
    <field name="stt" type="Int16" dataFormatString="### ### ###" width="60" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_nv" width="100" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ten_nv" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Name"></header>
    </field>
    <field name="ten_bp" width="300" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_vtr" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="chitieu_01" type="Boolean" width="60">
      <header v="" e=""></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz4GtcLwY5QwJ4cLHaHZRwax0WAiNCz2TjBDyoZq00qVF</Encrypted>]]></clientScript>
    </field>
    <field name="chitieu_02" type="Boolean" width="60">
      <header v="" e=""></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz4GtcLwY5QwJ4cLHaHZRwax0WAiNCz2TjBDyoZq00qVF</Encrypted>]]></clientScript>
    </field>
    <field name="chitieu_03" type="Boolean" width="60">
      <header v="" e=""></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz4GtcLwY5QwJ4cLHaHZRwax0WAiNCz2TjBDyoZq00qVF</Encrypted>]]></clientScript>
    </field>
    <field name="chitieu_04" type="Boolean" width="60">
      <header v="" e=""></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz4GtcLwY5QwJ4cLHaHZRwax0WAiNCz2TjBDyoZq00qVF</Encrypted>]]></clientScript>
    </field>
    <field name="chitieu_05" type="Boolean" width="60">
      <header v="" e=""></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz4GtcLwY5QwJ4cLHaHZRwax0WAiNCz2TjBDyoZq00qVF</Encrypted>]]></clientScript>
    </field>
    <field name="chitieu_06" type="Boolean" width="60">
      <header v="" e=""></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz4GtcLwY5QwJ4cLHaHZRwax0WAiNCz2TjBDyoZq00qVF</Encrypted>]]></clientScript>
    </field>
    <field name="chitieu_07" type="Boolean" width="60">
      <header v="" e=""></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz4GtcLwY5QwJ4cLHaHZRwax0WAiNCz2TjBDyoZq00qVF</Encrypted>]]></clientScript>
    </field>
    <field name="chitieu_08" type="Boolean" width="60">
      <header v="" e=""></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz4GtcLwY5QwJ4cLHaHZRwax0WAiNCz2TjBDyoZq00qVF</Encrypted>]]></clientScript>
    </field>
    <field name="chitieu_09" type="Boolean" width="60">
      <header v="" e=""></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz4GtcLwY5QwJ4cLHaHZRwax0WAiNCz2TjBDyoZq00qVF</Encrypted>]]></clientScript>
    </field>
    <field name="chitieu_10" type="Boolean" width="60">
      <header v="" e=""></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe59IuSGOziul8hi2ke/AgcAfwwwOW5NLQt7EnwZmuWC</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz4GtcLwY5QwJ4cLHaHZRwax0WAiNCz2TjBDyoZq00qVF</Encrypted>]]></clientScript>
    </field>
    <field name="stt_rec" width="0" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>
      <field name="ngay"/>
      <field name="ma_nv"/>
      <field name="ten_nv"/>
      <field name="ten_bp"/>
      <field name="ten_vtr"/>
      <field name="chitieu_01"/>
      <field name="chitieu_02"/>
      <field name="chitieu_03"/>
      <field name="chitieu_04"/>
      <field name="chitieu_05"/>
      <field name="chitieu_06"/>
      <field name="chitieu_07"/>
      <field name="chitieu_08"/>
      <field name="chitieu_09"/>
      <field name="chitieu_10"/>
      <field name="stt_rec"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TnKb2PhGvAybH+Swwm6OQl5XavlQfx2ShVtNhglY+0RFr+/e/xnhl2ZwzTrQYPM98aCf4etjs1zVbnWjUXQRQ/u/ZIlsQ6jmobkqvdAqqfu2zxjUts4EHvwMOT182wPTA3ImB5cuZW1Hb/9Aj1n2vA0iUjh39diOffLD2aZHq+Ib/2h+xeKBuCNmhkrICVMLRFH8kB4fZnPCuYsN7T7azBR9m8CV47Jq8XLUFFjOQeDnYx3hjU1IX8Ld8W6Skfy/UIFuF6l6KOCaOhj4d2TNpCsT3aMoEIvbWu3QbTlqkuN7Q==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BMVn4pmeBRSRI1xgt2TZH/46rQaDgnQzZIvmOEvvtiGqSRnb3jnXmcZamywq5cDUiMFWRwi6IiinsAZKHRntrN5EoN7Xol450KDPpP0MFPGVqQyzr/t7wbSLYcUy9uvICQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBHwD6V3UunWN6aIVgRxH54Ser3yo3rPUE97UIbCsaIZjB2y7MNuBpOQoynSZ97lfw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKXoDhppNgodsWkWZTnT9GGgq69vk1rInH+6kHrUmJ4Iaw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l16dCzkPCkdKPBNy4yMInqhFbmGwKKj7TWl9MVMGdvkN3lhjYoeyS5Lm5OCloznxTnQ==</Encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNGvl0yp/lxpJCYsfxfp8GEE5ybDKk0KGsLRpFEfMGS9aWcI9oO5AjxwwwnmJODmKBj2g/8WjFSTFF4ZNlqB65s=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciTfxXLWkc6njlqPxulQ8Q0LC8B5NMqT/jHhfrgr+Va</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1zCLI+8Tkm8hqD1gLNZ/XOQ69oncwIWVOr5WH5AhsWoECd1E6OQl1cKnOZvmPFF1WHlV+Jcsd+yyk5rkYFTT+crs86pIRp5JObREZ4nhJyHlF7rofv2/bvYBbNXhXF4L5hoD/Y3LgqoPApuANTKY8qmDW6lUGz0LQxF+t0Kkm4Qv</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAAD93335Q0cUe2C8U61Kbbt8bh0XMR28ZTWlfMX5mhfoeNtds6ElOo24305o5QM8r8=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjilkA1jTt+MbShOay/e2mInWJxVxZGhsqwEB4QZWor+oA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&+WQA8HilM9Mk+aBxHj2l1zCLI+8Tkm8hqD1gLNZ/XORAiOX1WdE77dwK4jQy+OCB8HFaw/rP80pG4PaGpz2ZuW4HfZA9Mr8yDm43Bcy9XO5cTVEaI4lJ5I/66esmMqo3</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRvaPlJ+aSv++/oks9vAYMCvC70n3qA5UqyRcaf9zrX0LaxA73+KSyUzeRSmLPIagcFIds1vuLGrABm1xegxBQ+H</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmNJdsB6OMvyGDRDslybEqOX3p+opaJhF5sg5yOH7K55IlWaWuOEL68FWiIPtllUl7lEOkqE6hQH0muCENpscjf0+lC89iOJ66eMskKkd7qrNQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BPOk+YGMLVjIiKTl11ot7fVVhDUkY9DrN6qL+KFGXiI6VNgvHnpdHWHcIp7dNjTjeiKWzUSIsZ+k9YsnRijkSs6FK4ZjalE4tE8fF9WqM3AerH1V5ZYjxaj/v4EUKvBfOrGgogHJFaJFWvphRXL/aLW2XIP0c6uACKIp3XGNzsq8</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BIpTeNUg5nOdbDiFaB3eSwSM7WwCNnsNwlbbZ4lBWFZJvyyvNe7vMQgZoLOs5PBx2YRF1pOFCqoqHZWJC61EoO1rTPlAEhdFyOkFVS4D6uJplMCJPHtloRaS5pufQjmRtn1gRGNLxNBGRyJra5vGtYNAennocy97srfN6ICmOYF+Mnjzn6me+eaBJwzHHtBA53M9ll1wO7aSjXm6PMJKINRuoxWsrLN4strVbbbdgVMqnY+0JVRoNz+ZJ5RQTQfBlTl2hhOf2JSr3Qb1vIs7t/yUXyUNgW/BAGZYaAQkXThOxA4Rj85F/6o1Z2soEakKsVqhgie6PxA1L5ia5lfeDv3ja3pO074qJdvt4T2CdOmhODtPX4Ov6Yyo2nOE0NNANw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4budiDR7ew/0fwMtoNKUzzpBma41LYDbAigFwTDDpOztZNIcESK2TAZXyAXi7GoJqEiutVx6HZqGnX5YlU0IobISOr9PsD8vWU2VvhLst86pF1XVm4B0pM22HGWawlZVbOo4nBNx6Td23bkbhmJ5sP9x6uCFk5a3udnXBQrflUiUnykt6tqqqND2x6Y9AJbm+auj1KmX/syoib949jEgJ1sP4</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYjYXYRYc0MA/fHbXj5R51/THLr4vqJR4aVL2yaCgOFpoqNtBnv/MOJOr6tRthqxxNdS9nIEhGzozzA9RfTYTN10TR95tDcGPVGTxPTpSHzqLfRVdfFkbfIjKlOicf/I/AdFh5kjO9kF4gsqjVv1liUuYuqyCbpu6Pg7s9iJijqR550YVGH1KtDbhzEU17UtJVRvHw3U49hOxg8lw1AheycMBhSIM7SpeJQR722GpHgNzHFVz9GHzPM/K95Gschu9p1SIkmpp29OT7DP7fG5/r5QRvuSlFnDMFbnYLiZrJCqCe7dNTJxZaZif4dNrl53i2bDuEHyxr88S/T6jJS2Z3QIUoW6iKFplUE8FvYgroEOLB7aVFrgW1mKEWF5XmXe7+ZxaqnSQRggqwGia+R2Qe6e6YwUhqvuUu3yoVRCiR7/V/uGtoyOxI3ZV/7DeN6wYA33hHw9SYPTSylDdyn64YXx8yjL9JxyE/YE8uQ+A2v1aha2xgtjbmBdwtVTMMZEeSTS8K1WN7598s0hEFV4X2b64HJ2TEHbpRMZ8kWmaF0wn9t6YnkN8gh6SvaouzmFanMDK0zU3lfBfVESyJNxNfJb8Nn3/1/Ys9pwie8gP8Pk9w==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&LWEtld0taB4J0SXPL3Rjz2dWdbTfLNLLc3efTyrS38TOZS6VPBi/0hI1xCQpy4CPeEKl9pMxj5tvPXZmaBwaVmXveCn9Drx/NtOPPl57qQd089U31BckId1mLYPNTJT+HI0YC6NDr0IKyKiDlLBgCGVgC0os5oM4sBtf/0ZRSqpl3N1REIaYb7/RAb0AvCmFviKbhqxA6TCkIOQ/WQGbcjKFw1nrpa99VsGWEv6OLm7y7aGGPjOY1IPBuZ8jGAwxa5mD5hXDcrr5qte2+dvhZJAn/y5sVcA5oearZr9N78GBMFD3gxJV0S4A0YTuX4k72jByYXNHXd35d9n6vZN4C84mxff2xzdw3/TSMZkJtsfnpilXjXSIfLT7GopgP1CTHijA1z4YZ6LmHNXm2WPF4/UtlKLs2UC9k7lY3ja4KcJQcDXI7vKCld955HhOZs6Mn8MWnTcH3uepAmSfPLKSz1CMYXV9O3gK9pCEPqGNgP8eF/g1U5b+DPgUue6L7iiX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&HXzZ47tx/DmldMkWK6w7BJbBfJZv9Enqy8jy7J4SfMTXROFjtUeppHds8T0tg3vFxvpsJQFlzJb9w7di+mqQhQcUhc+C++WWM88A0LM19APgMd+4cOkmvZIHdJpp0XbgmB5kNlhxJqyjssawVowLKD/dwbu6BrDbQ0Pqau6A+mh6wG+FJICCEWlenF6fgqWJgPvcJVfW0z7oETvNKwpl4U9bipzoJdRc7ESW0HTGe+H/KBuMeYAp1L4WtR4uMswPxaSW/68SkJGpt5l66zL6C4Vw/R+kcraZ++9oWDyxEF+5vf9pOuvhctSd46v5Vbl+5ZfWZay6dF4P5s7B70DNth03CxqFrC+saqtXXN5EmWGluP85hKA61mnRmYqxq6K+ppD995VHAae5/01NeOwaMW6UxiEDCElOWl23KVwSThT+bEM6Y7sgT+2IK/U0cXj1/hxk/vccmnF2n/2UN7f6ZZY3aZABGcFVQeWzhsvTfRPDIseBoSOOLvPQkaOTdu7k</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Save">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu395CED103RL84g1x2uo96VPXCqGtDZ7Q2nZxHjUCjOleiLDt26ztFF3ZBDiPzsDgwcRzfUAwHPsmQlakVIMseBmDPdykx5h74bEsvg7lZxN1q1a+1JFDGQw2hy9x07zpmxsyfaPWY+27hn/cP96l0xGhCTFLXgGb7JVjd44gp6mNOLxT+avfE1sBdDB0MylgBAsQ0z5uzYjWFvPZn5ydKur7rHjbUJEmFHE6/ARuh6h</Encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwNJb7NU+Jv72TBsR/SB74QH6a//Flg9ThtbAxKXedJeJ88OOstDPP2iUxte5HWOgS5N0ocLtsUBsyksWya6czYAqcC4Ty1PsWfAbD7nx6BbdT5oP4PG1ywZeSpUtF0byDhSbx6GAVYTQ1hToZ396sJs4Pl27hHrfyPVQmv3oUvo</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Save">
      <title v="Lưu giá trị chỉ tiêu$$90" e="Save$"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>

    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>