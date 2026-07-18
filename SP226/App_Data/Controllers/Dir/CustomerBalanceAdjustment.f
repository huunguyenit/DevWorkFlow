<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CheckBalanceBeforeEdit "
if @@view = 0 begin
  declare @$lockedDate nvarchar(512)
  if @@action = 'Edit' begin
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @ma_dvcs and r_edit = 1) begin
        select '' as script, '$NotAuthorized' as message
        return
      end
    end
    select @$lockedDate = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày khóa sổ.' else N'Data is locked, you must modify system locked date.' end
    if exists(select 1 from dmdvcsks where ma_dvcs = @ma_dvcs and year(ngay_ks) >= @nam) begin
      select '' as script, @$lockedDate as message
      return
    end
  end
end
">
]>

<dir table="dccdkh" code="nam, ma_dvcs, tk, ma_kh" order="nam, ma_dvcs, tk, ma_kh" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chỉnh số dư công nợ đầu kỳ " e="Customer Opening Balance Adjustment"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" disabled="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" align="left" clientDefault="Default" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = 1 and tk_cn = 1" check="loai_tk = 1 and tk_cn = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l"  readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã kh/ncc" e="Customer/Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check=" 1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Dư nợ" e="Debit"></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Đầu kỳ&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Opening Balance&lt;/div&gt;"></footer>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpvQJN/ksbIqriTKzmH5qrBJTCu5SWfl4zM8vMYnn0Gbw=</encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Dư có" e="Credit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpbNxUpnLPFYtk5Fexs8kBTGQ8G6UEJwU05GLL2dTWZHQ=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Dư nợ ngoại tệ" e="FC Debit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpaCYPG9+MS/CqVmemSXMECo62yMrolwF5+Afd0oKK354=</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Dư có ngoại tệ" e="FC Credit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpw2AsXz6rjXDexlXZk+W5KJ1gbGPNlrKsiocXd9QlXw0=</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11010: [tk].Label, [tk],[ten_tk%l]"/>
      <item value="11010: [ma_kh].Label, [ma_kh],[ten_kh%l]"/>
      <item value="110: [du_no00].Label, [du_no00]"/>
      <item value="110: [du_co00].Label, [du_co00]"/>
      <item value="110: [du_no_nt00].Label, [du_no_nt00]"/>
      <item value="110: [du_co_nt00].Label, [du_co_nt00]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbnkif3ySTcGNaRkEAXC8hiEa79hPoPjzlKrPRDEPKA/W+LZKsEE8BqSF7fz0+oeZRYcto6fqhNIlJwo14dgIOJkAXHsqfC+Mrm63yVNE8hAkyKwOtIWi7wpd1mwYtAG782COTCtHMQ0vxdWEcwiqOpA5AYiHn1DSBwCwNRImYjTxWzrwg7laeImsMJQeSoyT/AYFjuUAGDxTEkbdZ7CIxCI9FIJMKTvmr+6eGra//jRpaJXKS5EUQy97AgiBxqm+YDRvsaAcLaehsBg+pKK7GJCNlas/cTjSEHbbuq4szKNUHt6ywV1FigGFh5eGMIWwA=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CheckBalanceBeforeEdit;
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CheckBalanceBeforeEdit;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf0A8m5tLHoHdAvUAjrQPDTCwYigCJ7G8JpWEjNymOr/vy2Wm21UK25E0hBIChgHWXNyqewVqP714SLNShx4588S3PqMPW+hUuIFr03Us2ISP</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulivDlk0rPC3qob/iWX3ePv5I7kCMb6uI9O0aiAlMrbRcb+hm6z3WyIASAbBb87Rm0P5V3mUkkzU3BYbkCFGIR2352XDwEsVa8Xxp51a4v7ZuB6zSKMzvogAbMP2Lxh6IL7gnFy67wgcFfPFjpL54gFWhR9JWRJm35abanF9bLNG2GoReD/qrsEw8x1OcW7pb56E4ixxon8J+f+IHwHgCj5/+6NxvKp8UGPujDNv34+fe/QFGpUMq06VgYxVa27oLVta8rsOb7P4DNPru2W78D6KWlcji09ZLTDQsln3dNcGp55JhsGc1WfKsrC97O0Q/ZpIaI6PqUxudbxt2SxSMFeahHnMeqZF3Zdl6kzIJc6miyXQFI4WUYPDuz97pqwZIZN5XMTR6CaHvCt1ZYBd4cKU9mryYCvVJ1GeY5QDzkgnVrn55PVw6Y3MJu4UDzGckE7lC1Hfms47bB/mVj29virii8zuPbxQczQUaPDd1JIspqXjXyfwFejnTkzXogJKjuz</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nFJssn+cBPm60rXisaJgw0pBQsnUwrDbihcF8Kltjuc3pWiJwx3dB+SixxVeFIXlQTz5URV70i27VZ3ItsmHRVkfAqNIqH5kqupW4mZ+qK+csLjfeHcDosFJMORj4wTUlNmL9uvXeOHghX7iOjHgtzeGRLUa00BrmrBZu+B1xdFNVzdvt4c/IWrZX8yknCbtg8sVOIZOa5rxIp0kWHTSGGs0uZV6WS/0Y3gGY2OxfYK8N2kFOiRoDNwgWAHIib+F4OiRv5Fx+4mk3I7XgxEUIwO1NEIVf47GNuNx6sVntVtd/aGftnZ3axBFn1PMzhDKbgcayMILz4xTGGnet+7Uh1Um4H30Q2CgzoFXK0M2dLlA=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1II1gF//A0y1pxU7o4CQki4KEWu9ua+NRhsBhTVNifa5rAn1cvtCWcQU1EqlqAtyt6FM12VIG7W8JW+PI4CjZulgzlbqCZkSBONbk4SOKCgK1DTCTRLR2KPnhM0KHpVK1gPDCj/qMahYUUey86lz9z2H7QkO6vwew+IzsKJYXLWjoLO7bgq7spRz7+YjPhdi94oNnKUVSdV+UrQ2tmK5KpB4HIB1PU4TJMZcAFxONlylJ7+IWfw8djRU4LVDBh9DHeLWJS3Emx3bW9/UnzcFSTwFwWCITM8hLIX45RsU/fgz8P8VGr9qsSd/XkUDCJo04X3SpEzgl6Y2mTHh8nPHoxBUvonDfheyXMYfE2GZIkMqbBSOszc00VcRI5/vQxc7LBW4VT5uC3wyvFs1dRq/Px3/SqZiBF8LJn67IWi8zkQEWYohgW9dnXbYLhIz10FdeSmzDlW+5H7WrFeIijCto6kzvkie1oBWUtdVP6N4lgR8SDCprWPy+egLcb6SsKAydY9HogIw6cQn1bC0EAMt3g=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHbjveXsmJ4pkjBvMl7kGE7kP2kikplDWg+IbwxCngMC2cCqaRWwFZQu4RoVbw0mCB31O5qux83LiuaWGctPMt0DCz1sB/uHPEr/nniSMFMlmuMN5glaO13dmtCKBnx120FIBQaBoDUHnRDPMGu/h0nRMsdCPbKcSYMODXLeQ88Zluuf/1sY4a6QDi77ObszbELxY3iD58H3vX6oq0dbLQQ21/z/AP6NTtG++Xnzmadq8WePtRgI/6xrGvLjzM9I/qCwYUPC1MzQngzp0a/IvCk0YAvIFcbkRrGrXOpZgRNG+qrQcVM9AISU6PkcTnBhsZ2JLNHtMzq9DyhRl3ULOGg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbev+SPD20ydJUl3KFBhnojPALGQYtc5fkJSUdQNlPKpN0++fvOwmWujULnjbpYScpHbRgats/bllXhMMcPocvuJHPMk6nPdJQoafqwPKAOmY5WhtDrXMNOysKfoxLkYxHnXOfM08B1sFKamq0PkBM9FSkGmjslj5QmoR7hBIH1fh17Juf+VdnI1jf8oEGteuNRaGZVsUPrMOouE5uqXtXNv9lXw3ghaxYmWe9AQhCRqOxcS81+62BelGyQVoB5WE4+sxtbELPi9NExqaxzx3OgqMM5MPPhs4YXlwNykM3bfTiDoCuGkaYZBPcJcss5nBAh35iMUWyfUAsMd6ovzUZj/o=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XHr/yZgO9BS8mxonQy//dUKxwb4BDwl4TZFScf3PuHCHT8lu7Vb4VWECTavzpAaUPKCo5vr50kkL7BI6/GSybv1k19DVRj7qO4aYvwWXOZ30v9i5nZHKnNignD26HtnZj7dAEez4bLAbHx46/T95VyhuxYLEa4x5oRJ3KREzAen+ANuJkzuP4wH1WC4VTK4/Suik0xxvCKStsUsTh+/+3OZ3D2eHQ7tuNbbUgzQOOBYS6KWN+pOGY4Azkv0MNjLnqCB+3pOvAq/OWrjajrgPz7j8sNs+mc7tL7rgNofmvmkK468vLCxCxuHXgG3u3919VlSCfr8Qtb1Lml14wRNfsB0RXv1UJ+Rcnu6a27cl/aBoCx4zhQYHtEp/Das6VD7X12/v0ihMNKkHvbu+mHNu13WDaiomn/OUYxI1XvYxh9YeDZBeFx7towRFmZGJsboE6diFvfOEF9O+dagWPxZLaFaiZZzSqdg29JYCBoeUFNwZ55sKWFdDk3nUBWfEgrS7Q==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmRo54ol5vOnEpdrVadgaudPllJrIQFKbo2h8Tf8LMeFazc3Xpf1ICmInXmxlAU0QlHv+UkmEUwgBURitNlzJBP6MtqIT9D2Dkewwo5wa6bzyIdQLo9RMUPTjJuhgYZKJw==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GOEIMKqqkSoK9gqDO/lshHNIa3sF/lN3AESuqA4xnjwqF+CuqutquzNhSUmURqj5CiuTlUQkV+y8k2oO2y0Y+nwaWJFxAcK33iKYWTnKKQfGted+qZvz6ml9eYVV6QesjWgFqotyGP+rEJg4ZVLDd44cucK3E9YWXN4w8mO2TBf4QhJx5aFx8B7vE7Y4zLF34AKX4V3TVHrF3DhD+p148+qX52D6Zx9gzc8p3sOvuMAmvZKC4SaACh9mkUrab1GMFNVeogBqv9XNscKWwIhXTw0TBcRMbHWC+mD4gh5xN7nmQ6BZjzgMCgNKz4spUxhXYUXM7V4sq2010aYTAjcD3KsY7BHYXPNAQy7AuhwxswFS6ZSqSm/1bIyqjw9s8JoJZIXEfHHR8ivOHIrf0a5bUOKX9+tF3iAmoJ5/pylpQqfRx6BZ91V75qfUi56zcE+Qdt4xJK5LOieP7SgzkXaI4RkPQvafkV0X5IVlx1ANKzc6pIvH43u3x3ypoUbZpaMuQ==</encrypted>]]>
    </text>
  </script>
</dir>