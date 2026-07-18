<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir table="hrnvnghi0" code="stt_rec, thu, ngay_hl_tu" order="ma_nv, ngay_hl_tu, thu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo lịch nghỉ theo nhân viên" e="Non-working Days by Employee"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I+qBtTtKcMGUXHMVvGKiGeD279yX3T+TomsXYLyVtY9wKau2oFjx8V3CM1xdCtnT+bVnB0S8ZwmyXQ0DrEvf2k=</Encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="thu" isPrimaryKey="true" clientDefault="1">
      <header v="Thứ" e="Day of Week"></header>
      <clientScript>&OnSelectionOutline;</clientScript>
      <items style="DropDownList">
        <item value="2">
          <text v="Thứ 2" e="Monday"/>
        </item>
        <item value="3">
          <text v="Thứ 3" e="Tuesday"/>
        </item>
        <item value="4">
          <text v="Thứ 4" e="Wednesday"/>
        </item>
        <item value="5">
          <text v="Thứ 5" e="Thursday"/>
        </item>
        <item value="6">
          <text v="Thứ 6" e="Friday"/>
        </item>
        <item value="7">
          <text v="Thứ 7" e="Saturday"/>
        </item>
        <item value="1">
          <text v="Chủ nhật" e="Sunday"/>
        </item>
      </items>
    </field>
    <field name="so_gio" type="Decimal" dataFormatString="#0.00" clientDefault="0">
      <header v="Số giờ" e="Hours"></header>
      <items style="Numeric"/>
    </field>
    <field name="ten_thu%l" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_hl_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hiệu lực đến" e="Effective Date to"></header>
    </field>

    <field name="ma_bp" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_bp%l" external="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 330, 0"/>
      <item value="110011: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="1100--: [thu].Label, [thu]"/>
      <item value="1100-1: [so_gio].Label, [so_gio], [ten_thu%l]"/>
      <item value="1100-1: [ngay_hl_tu].Label, [ngay_hl_tu], [ma_bp]"/>
      <item value="1100-1: [ngay_hl_den].Label, [ngay_hl_den], [ten_bp%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHj+qpqrYi1uSk2p6sLvrQLowYBLgk9IXTzohzDUz+9Hg+Nuz3Ynd7MebWQt5xkdg82IFz96gFnLJYKj9BbS3858411/GszaM4z46roLFy79</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAnfmKSAJtKy5hx6O7sHsw70IEYzJqUew2V8rCEoJyVDsT0WQCHWgSkjB0qcw8Yn9bXt55c1MrMxIFw1m8DHXk0W0Of+db2L3anjz6jH/USe</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5wYSL54cQwpc6EiB1XHUdKnKfGkdadgCzywju5Y87VGdCNpd4KFOwYQ3UljlWMVXlKFtOLx4LCbu2rM2T3SERfAKf8MLpn4h6Pf1aSmLg7xPQuXZpWsRZ2Yhr6juAgXEPJ8lKuVfg3TcbDGp+IMVvs3Fwxztkm+CcUxgDUGo2uNgDAcrd5KCJCfZIhWPV60ag==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr79W3LOCFnIIAMnpNmBKFXgIKAfBKh/IG/Ve8Di0T3TrT2iPdDy523vgY3csRlUhl82BlOidy+gC1xQiUqenWSeZn3dWgCowJkqvUNryXDTKCH19N8AUo6zRSCT17Qp2ZW9XHKRFFNUjM2QhxreZpJ278qYMjH6PFiEFkMtsJwO+5fk0lxjYKORLu/aL0GG/+LqcaJRpu03lCIlUQmlazh66KPF6zAgjo4CItLbNzWoxEodwf7fxfK2oTipA07XBYKusPibPiroApz8PfRvjjemqp2wuFnsbwbtG1aqUygKyBX2h3LLkMW9a1Ffwc8iXbiv0k1Qq1DeD5aVdUh2Mljd5nHAFvGvWw4jhzhRyuvISd6HDOHPCH2HobxNGYOXp3U61frnDju6fJooxec36EC1wqMku1wxtFTOXWvoGKGEuV6jwp8c1jki/N7MBN83Yn8jXJSBkwZjpbajOfByQxc51JaReoYamInNMsrqXV49Ck3IVNyDhlWCMfyv4+frKR35sa7QuZwma0YgopHQECnZTKXq/m8JVs7vNntcTeEw7Hf8SsfS2Vh7kaOUF+qB7pSi6AfB85uWRD8QXCQ8XSSWA=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU79VyRyBChN7cVg/V7eyUldYGu/K+0mZk5mSIxhXbP83VFYnwoGLoNQIhLP0iax7arqPDe9+9Cbsuh8gvezSdVt745progY9zZa+8LkILGqzEV+ZQppz2Uu9y+Vn1hye4ilG05SmXFycbbyy6E08alTt9YVdAi/HglFo3uXuQGBvBWTyhlkHh3PJMypFkXCQn0JlNoNsUDTGlfbPUm42udipLxDnNwkw+WNhkbmrZfZxZ4aaCYyFepfi4PZ5E3+QqnMXtnHaD/XQqIu6Jl9p/PwcMxMyZo+IG5Z2BawZLRvo=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGuKTeynFegdOUv6WDwQUepiQtsuFQeDme8h1O78zTj0+/UMdIFftn3XNe0P+V/RGCadSKt+Kbbf/7sc5yVGoHApfnlk28gW3irwBn4JBbcEAiW7WBwhQVcnrAtE1dt4WQRgGzIAXocJF+XPpdKhAmu4sC+y0HB1AaAL7hzwaL9F</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLzHVitzF8ntYb6OKtVQ4Rk41Kefh0Lt00aAkyMqiamPKTST8kbgocIfE7taEG3b1l2YvZucacd8qYewvqHcJyz9rKrBG9CAgHi6JXdmpevKVu5zV/13RgRAnkLVCANS3nAuoHRXIeRBQu7ZuYD/26Rwnf/PuhoCOOn2ESlIaNRAoMj4XgS2W/Czy+6f32xNJxYD2QajiSKeGVkS+XDEt5pNdOXkZbKrzA0i9wNAuPITbJgZXWd6Aic8Hw8quZLRBBv13+uHp5uMF/kejL1WcO8tUMPI7b6Ypgerb3sIiuYKvQjE0bSyNRiINonVbPfFalzJT5r6R2ipJpmq0inVlUdrUHEZqvDAWXUnbu1o+/PG0=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV8ekEqyv9bw9S6UjjaWj3T4e7t8Bi1FjVQvm+sJulRrzAjn9kt37PTvR7+vaWuXiMeD+gsATdpzdW318ged06b19lBbvCcnSLeRUUWeYHzAOTeWUTQsnPeaZDi3Uc0D8Z2ZnV4vJCo7lptWOnSFerkg1IiA+API4Th4JDjJ4naRjYdvED48i3QgsPqfe3WPuS9qFvAXx6QyHWQp0hmHAcuLoXNoMwOxBHiW1ZQ/UKimn</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22V5ocnJh06nEhZs5zZ2pkuhzATxboIs0/jbaM6xQGfQ3M44d4PzGIW1hUauJXmhgX5tviSqWVS9N0Iq1OX9/Vg02cq/0u/XysuibbMjGnQn1YF3WozF4P3RSLFBbxU5JjA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtcUTywWAtjp5kQe+T2zsL5cNJXzzc+Ry3Rx9rRQrDQY+AhWKcq1Or18qHaGLXUwAdhhD6gwgDzwRJs7bNe8nnPFu7ftbvGoBRFtWa2AmaRbOxVmLs9ur7j/HiCxGCaubtiazf7462suWEMWp+7tXsaXRebhDc5Ftq41ANG1/gfX0y0NJSS5RqPlKDjXLzoLKHFp1PE11Mt4ftRn94mryas3UoZK27J5IBz3GhuhPZ2Whl/CZrRwlgf53RJfRlvLxahDaGwyjqkB61RIvbiUaxLLFbCBz9EAJ3MQPC06h7Yiv7nEk5macIjHezgjQf5QdXkvjQ5ejA++0kPZZhVcZUBPutchwjpxnkd33npRGjCOi</Encrypted>]]>
      &OutlineEntry;
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWNRE7oibOz15UAauBnUtmvG2plJ0n8VduM9zqgaRb4YlgHc2QW3PV5HfWGJB4RT7LQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;

</dir>