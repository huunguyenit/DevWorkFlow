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

<dir table="dccdtk" code="nam, ma_dvcs, tk" order="nam, ma_dvcs, tk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chỉnh số dư đầu kỳ các tài khoản" e="Account Opening Balance Adjustment"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" disabled="true" allowNulls="false" dataFormatString="###0" inactivate="true">
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
    <field name="tk" isPrimaryKey="true" allowNulls="false" align="left">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1' and tk_cn = '0'" check="loai_tk = 1 and tk_cn = '0'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư nợ" e="Debit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpvQJN/ksbIqriTKzmH5qrBJTCu5SWfl4zM8vMYnn0Gbw=</encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư có" e="Credit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpbNxUpnLPFYtk5Fexs8kBTGQ8G6UEJwU05GLL2dTWZHQ=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư nợ ngoại tệ" e="FC Debit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpaCYPG9+MS/CqVmemSXMECo62yMrolwF5+Afd0oKK354=</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" allowSorting="true" allowFilter="true" align="right">
      <header v="Dư có ngoại tệ" e="FC Credit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpw2AsXz6rjXDexlXZk+W5KJ1gbGPNlrKsiocXd9QlXw0=</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="112, 40, 60, 100, 230"/>
      <item value="11---: [nam].Label, [nam]"/>
      <item value="11010: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11010: [tk].Label, [tk],[ten_tk%l]"/>
      <item value="110--: [du_no00].Label, [du_no00]"/>
      <item value="110--: [du_co00].Label, [du_co00]"/>
      <item value="110--: [du_no_nt00].Label, [du_no_nt00]"/>
      <item value="110--: [du_co_nt00].Label, [du_co_nt00]"/>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulivDlk0rPC3qob/iWX3ePv5I7kCMb6uI9O0aiAlMrbRcb+hm6z3WyIASAbBb87Rm0PaI5pSuKC8ootWOG3HhMdsv28/hR0eEM3Umun3ew0N6MlRxJ3BCziMI3oiQ8MqswB3lvJNvC8tlChgw7WrBprzwF07wjw87DL/JZRlcgR+hQS0+RMmU/COfNhocQwrWJHkaGfui9tU5WtEaf4kFNnEz7a9w6XH/QeiQ7KOVUh952pivpS0X6KWEUtSgTsNmgCSTzMhx0QmTpUHauq1yEGyWGBwcFb6qHwUYuozaJq92GJ5QdoR6iPuZRsKKhQSqkjaj3tJhSxWB5MLxVTWWtYnk6nJEzwVaDhbAsQqTndrQj2aB9UdnFJA1CBGAe4e6UZfpiHD9asDeRSgqelXxSpebY+8TFMk1QBkd7bnOf/pIsgvEShWX3fUEz6/BAND76croDE/sSf+xAcaLb//SIeWg==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nrMMuIlLeaiPtZjKlR+2Vpo4vomxC5RnMF7Joc/YEl1j7oEyA0wTitI44Oh8e2PYg9E5DGJeS3L8773Uw75KzIxC4EnTaqi4Jad5Uep0gG9n8VOdoyV0Qy3uKLpfdWVPX11aF75+Jkpul3pXRnFaoVy+raTlPaWQ9X3QZ35Lgx6PdBYoJM6aXkVZ3nf268VPwsF+0QTGiRismHZftd+nSmLCJ6sva4B330AT0XXsTZRncHviauu08uF8vMZtXTogk</encrypted>]]>
      </text>
    </command>

    <command event ="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1II1gF//A0y1pxU7o4CQkjprBPap7mU9e+C/XZCXghixUHsgxZFL2GQXNGQka2CN0/HkiD81c7p/bboZ6o6YXFb3Qwuoefu5cocJrfb3Q8HKhcbkKZQw0aaHvyXxwz4mtwHYnY3XntferQT0Z0CKdcLbnX3ywmSqd1QruhFAmrfeAKCEiIxq+cDwuYZkSDaXKhtJPSIh3n1WV3Df+fHcKjHflq+VTTqFKq2aj+2jLNF1Mk1Rnp+8+x9onCGYUU2vUeBLsyeOhNLO56e7/tkdhdxSZGetK4AMuv/TNiWNxwEMWWnHQihc7aD/iXxib4EYA9F93k3KTU+uEbEgxU66VQ1frA2jkjg6Mil0Cl7PtMCuYQRnWH9gfO2vfriOSPERQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHbjveXsmJ4pkjBvMl7kGE7kP2kikplDWg+IbwxCngMCBSlQEz6AAlFJdI/NiVoqHspVx7QT3W9TQkMn1qL+/IIBtAwsvENu23GZBSkTVbsjVjYB8Y/EjPVeS1QdRIEu56rm9QOwm5LI7+2FPvW8ZQDkbVGEPzzD0NBQmkR+ktBJuYSDcuUE+cPiA2wNVAH9bR3TOzmG6NU8x2pFUQk2uXw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6WvrzFOlC1fV/bZ0ze9ChK0sh+pyt+aV8L2MJe5zN5GJJdzGgD7tCbuG6nF8qu0DVe2zjh4ROiZPgl8v+dJdWpFlVCAYOn7ZSUbBoUr1UV4v9Ko5s0oGhkyd7W+Ov8+Bgy6fp6lV93EgeSg2M6nwOg3OIn0LxxcBtqDpyTWGurJL8zJhiNkf+2dMmFbGb48PHVn/TZefS45o222VAx+BYk+dKvmgvSEIKzDYFDMfKcDgAvfbI8oKSeh65Si8yckNy8Cbs53UP0EfKOlBDUN1I6s=</encrypted>]]>
      </text>
    </command>

    <command event ="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XHr/yZgO9BS8mxonQy//dUKxwb4BDwl4TZFScf3PuHCHT8lu7Vb4VWECTavzpAaUPKCo5vr50kkL7BI6/GSybv1k19DVRj7qO4aYvwWXOZ30v9i5nZHKnNignD26HtnZj7dAEez4bLAbHx46/T95VyhuxYLEa4x5oRJ3KREzAen+ANuJkzuP4wH1WC4VTK4/Suik0xxvCKStsUsTh+/+3OZ3D2eHQ7tuNbbUgzQOOBYS6KWN+pOGY4Azkv0MNjLnqCB+3pOvAq/OWrjajrgPz7j8sNs+mc7tL7rgNofmvmkK468vLCxCxuHXgG3u3919VlSCfr8Qtb1Lml14wRNfsB0RXv1UJ+Rcnu6a27cl/aBoCx4zhQYHtEp/Das6VD7X12/v0ihMNKkHvbu+mHNu13WDaiomn/OUYxI1XvYxh9YeDZBeFx7towRFmZGJsboE6diFvfOEF9O+dagWPxZLaFaiZZzSqdg29JYCBoeUFNwZ55sKWFdDk3nUBWfEgrS7Q==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GOEIMKqqkSoK9gqDO/lshHNIa3sF/lN3AESuqA4xnjwjYXUgmqgnimi6Y2tFBmh++25I30fhqjRgO8QS+a+efHa4P/xeFAAiMCXfi+RXLIpgXGTwjq3VNcR0cSt+2YOilOAIq/c90xL+VSju9lCyKb10RmQNJ95rvQSEFoEpmQKxhKlSNeM0rxFXzrXazwbO5fQPaWQkSP2v9Oeav5KclHx4hRImPHYVxlmkSG0K9ovD7KGF0xZzdCzNbbIuZCNZk3Twrmd5oCzWkPUppRFu54A1YDcBi9+TICfgIknVLeYz8e9zya85H6Jrsh0XVXXWYqfLBxNq+AuxHAE8au7DzDON8EvrRAkyvRr1iU3+lkvIM1hibNvX23CAKYUamCHzacEi1LyAq5XooXuFubYK8Q75OZCM7jduj0gkZsf57k+FYBDTpRRikSQfhLUGso385+AfTziy9hXNnSveYCjowVR7rhIGV5vTcwefpodSC4R</encrypted>]]>
    </text>
  </script>
</dir>