<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY Controller "UpdateExchangeRateTran">

  <!ENTITY CommandWhenBeforeEdit "
if @@view = 0 begin
  if @@action = 'Edit' begin
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @ma_dvcs and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
    declare @$lockedDate nvarchar(512)
    select @$lockedDate = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày khóa sổ.' else N'Data is locked, you must modify system locked date.' end
    if exists(select 1 from dmdvcsks where ma_dvcs = @ma_dvcs and year(ngay_ks) &gt;= (select nam_bd from dmstt)) begin
      select @message as script, @$lockedDate as message
      return
    end
  end
end">

  <!ENTITY k0 "@ky = $ky.OldValue and @nam = $nam.OldValue and @ma_dvcs = $ma_dvcs.OldValue and @tk = $tk.OldValue">
  <!ENTITY k1 "ky = @ky and nam = @nam and ma_dvcs = @ma_dvcs and tk = @tk">
  <!ENTITY k2 "ky = $ky.OldValue and nam = $nam.OldValue and ma_dvcs = $ma_dvcs.OldValue and tk = $tk.OldValue">
]>

<dir table="dmtgdg" code="ky, nam, ma_dvcs, tk" order="ky, nam, ma_dvcs, tk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tỷ giá đánh giá" e="Revaluation Exchange Rate"></title>
  <fields>

    <field name="ky" type="Decimal" isPrimaryKey="true"  dataFormatString="#0" hidden="true">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"/>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" dataFormatString="###0" hidden="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" isPrimaryKey="true" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1))) and status = '1'" check="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)))" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&z+Zxm2gaadWgJ7qSKmmTtfJHCtGPE/LztxxsY0LOX8kvR8ZOQ9f+mL6Pwn1BLqs/</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_nt" clientDefault="Default" allowNulls="false">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0') and status = '1'" check="ma_nt not in(select isnull(val,'') from options where name = 'm_ma_nt0')" information="ma_nt$dmnt.ten_nt%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PDvdTvJOEgRcT99dbkFNK7EOXWzm++jrRim2d/a5RnX</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKZVQEGkLlZT8wq7O4Xpypl4WoadpMupI1URUcHhOG4y</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>

    <field name="tk" isPrimaryKey="true" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="tk in (select tk from dmcltg where status = '1') and ma_nt = '{$%c[ma_nt]}' and loai_tk = 1 and status = '1'" check="tk in (select tk from dmcltg where status = '1') and ma_nt = '{$%c[ma_nt]}' and loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ghi_chu" row="2">
      <header v="Ghi chú" e="Note"></header>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130, 0, 0"/>
      <item value="110010000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="110010011: [ma_nt].Label, [ma_nt], [ten_nt%l], [ky], [nam]"/>
      <item value="1100-----: [ty_gia].Label, [ty_gia]"/>
      <item value="110010000: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110000000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkW5VaPRT1bQo5kzjHaDwgynKCdEc2djy1j8/wJsgxtVqY3fvPId5Dy2VsSJPpi4eg5oD6lF5a3OAEkSlBsTSM7IIJtR7Pxzz1lan9MUEa2ifET38cnSJSC2leT6CH9gWgDh/RPeI3yXAUehG6JuUX/bqUhQ96f7eFaexnvHkpamQ==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQutA0P717mBw1s1umlyYS3QDgFrbH6fTyn+FR/EfMIoEXByUaCEglSElgutHC32OkrgerNlr+uKQv3oggjHpVXkNVSL8/swxcF7xDJcIA01HB55/dUhD3to6IEbV7sjqfxMTsLaoAZ3rzi+7P3a5CDFgBQ+xYi85eZ/ADFd/isL/7</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6i/8PvYRa2nsgbg9xSi0raeSrgf75CHRp764/zthSbkOI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQusICyq41IB1siciXfR4ZBwSGj4ZvlhmOUQ+twvRaZiop</Encrypted>]]>&CommandWhenBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ijxfWL9UUoI6IwPZ7BjgVDiaU196//DThT5EJmwafshk=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQusICyq41IB1siciXfR4ZBwSGj4ZvlhmOUQ+twvRaZiop</Encrypted>]]>&CommandWhenBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcI0P/H+AZcpPJ+89k+Mq/qf1yOewTR1n76l513CG+Wh7</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI+saNVRqO0lcJc+E/2wzD8kHHZ0CrQudjhV25IdJHMVezc/Z3XhtsBIa469h6rTDcgfAvAL8Ko4Bx/ftHO4eTdCcqcqTZjz6yZtY1/jlSMl0SIatVxf8+MfM4BtF4n0OyigjWyhBJuKdwTDf1ZoT+XcM62ROPjF9bbyOOAWR/N5culxNRS1kb5LQ2Z59yzdcdlKkYlueUHG5xmyhkZe3NEk3v3Lie5q2agWScDZrRavO+m6JcX4sO1zy5lVCcDAgsncIyJFaUpAUWh0yiEaZjjBMZYZgzuXUexSOorKrf/2atxV9I1RxJR2nosJrV0GYFv7UFDS8foJQIzQ6K8JpL9rIDlsoiXZodePrPGuEAh0yhk3Y1Z4pQ0jqj1QH7qHbz</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CqQkA+CAc0ekwifZZLEvnfA==</Encrypted>]]>&k1;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbDQuWp/INEfRg8i2ZohvuRa7IUKZIrpPJyu2JUTPmTcX9vYpcd85KRqzWZQhuNdC7Qs7khtPfoa5e0xUVDa6yNRYCtzx6+EO8RQgC0TEGrePmyP1xnyRUBzrtwE+ns2l2P+r7E9TUMoQ3m4PdNKBZlLqzzHvXKH4Kvg0pcF7+LjJLlqOyRSQTkQ3Gs2rh85Jw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteUI1QmUgP10yHksf+Ca1iWw==</Encrypted>]]>&k2;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbDQuWp/INEfRg8i2ZohvuQsXt1n0J0oIK597GJRgsE6mmj+vB5Xe9KtNDJohwjcnwBnTeNZsaVOC1St89OJkVTfhpk64f0jh4zHJsl1IzH22iU56HXB14lmAN621KmtWGe0SovEMj93uUCPSGi0gKM=</Encrypted>]]>&k0;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLbWKoL5jETtroDAedIqUQR42mEpHAQGseHKQPt+hO6zMVZCLu0/56nviMMRE2b0t5VXIS9FErUnVAIrYHbfYuSE=</Encrypted>]]>&k2;<![CDATA[<Encrypted>&YARH0qdfPiWP620v9FAeSPICrzWaA8H4buAdoshnAjQ=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&x2vMhmcVHH3IWkEVW8yP64FWcBQy+GNPmszxRdU0sWxJX+s1XF+inFG0x366ZP1PLOafzVoz3ermrxEUg8x/m3WOFQ25tkJP1yt12QpOZkL5xAJ1iFG6m4BDRNnFnUZ+ej+c4z+KLXSicyDHJ4H3wg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV+ON7PtGJwPs+Ue1dhk9iTEMusobpy/mpGNP17+b7z99</Encrypted>]]>&k1;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22alPjDnV4JapQMqYNEp52dUsFiuBX/iYGBOeR/lqE321hTMnQ3rF0X8jNlGSJdBqqBSOkhTUi4RRejGWS+0B5PD7mI6KzVs7D1m2u2o0iJqFt5e8Ip1tzpAkfFjLA9kQ16XrobytEkmJrCGn0hsPj143B3Zs2Ewq7VnMRLGlVq/P5GWFbXnsrYajKa6g7/VoTfMzykrpLrjg6xialbmqbUVpMaaEFN2T00fbyWhtmvgTU5YLkoSb6uJhBvYrBhMXDxwTgFVObuz5XznY5uWCnL0Db21vT1SyvlWXtFBghHWnssXD7QQK/N2TAQZ3G0goYc7/RqhzpnbLSKjCOrHiwf+yadAaSc6x9+sNcOmYy4vd8hRb5s93vm5WtEZ+oG7jEeH87gBlxW+ec2xylgTyhnh9fZulWRJThJAld6QjqMHmIyBkhPR0tUZGjcJujrOAo210E6KuBzzdAwGB9shCuO9WSNneRwnVAjjMRcWYR5tV8a1uZenaC2hSUaojWC4oiQ==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bSuNVcsiFY2XvyWSbeqhk7mWWN9vGjAWR5YhmM7AjFn</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrSxwArwbRx6xJ64RqQuObwSBNQzkR44X4xOY04DsJQgAaehpAJ0Cfa4HPHw6AiV0fg==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYraWk1puRRmoNTnTG2cUDrmMEU0PPFd763XKrCGWI/8E5OSUFcZr3gql8b1amK+j0aw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrVdJ5hKhgjliXJ+tzHP3Kd5rYlwC+ep5z0DHiyprLdXswfTD71QHM3Nib2uFG8sdvA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgTulTLA/6sBg62ZKYnHDfQeboQ+CRKzBJpHhpBfbysazgXMt2nrfifSEtpUkCJpXM=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrWCb3wo6Lqgyn6g4MKqoL7GUelJpp4krqQLnh8ez0LtLCb/1Z79aV1GNwGdsy1+yzbEMLP57ByiUIj36p4AMIBY=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrarUWHOMBIZklf9j5Tg5cru/TSHojbB6/dWlMCe/BT6Ljp+UIU4aJhpCCd+p/rer0A==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrWCb3wo6Lqgyn6g4MKqoL7EhBUUV5sV0ZoD7My32bMIUOpP4Z1LDWl945c7b9X7zCE2bgmteCPcQHh1zw92KBaI=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYrQiKBZ/ItM5niFlX7/stf7dZYQXtrDLphXldwDT0dX9iW7QsqS20sbYluR456dUH1w8Pe2+istLjuWZ1+SiR/ao=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHemLmDblVZZyuvFaGPTzKq8K9wbgN5j3pldI02fUnyOHic5j/+Mvh3Yt7hZIHgfnkYgGj0ipmYLBxdpIBFY9DNg=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&z+Zxm2gaadWgJ7qSKmmTtYctF+7cqdc2u5HQZyRFRDzVDc1g+wHBqQK53tMTkZW1/PyaTPdphA9buQ5sx5mWXe5cI2py/hreh4Vfn81ivJLFvzr0paLRQo6/5MtwclJnEBubveKJXdlVPaelJMO94g==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&eQDg7Nv1ZPcHTYx4U3adqKFJTIPGNIAurjKOgBhPhvZglbRPV7cEDJ2bb5Erugb+WHhSsEzU05fwFyU5c8UqKdKavv6cy8pt+gvubCfpmOnr27UN0o/Q0nv9pUV8V7dDp5UKn0fWQzF+Y7YNHfADh5xiWnCggjy5tk/yb/Lgpzmymd6p9mdGhUS4NDF7CMoa3EWbZAmmW3lXAUbOkjbdEIdLe2mU/iQu9tHvm7Jg3h080OedFEK9h0l89RCCBZH7</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHc7X/84zX1ElDBQ0Oio9BYhpU71ALmfk5ffMVXbbEaC95FDNPuPVyyo0paJ5AWSXOQ/onvbV5bNXYdtHuIDX7H8jFKJNFaPszc306jhi5p99HS1Qv0eP8NdyIUbO1I6wk/pqKxK7QPAcrH6r+damiGC73rhPomDcEUQKzKOxZPYho45Uy+mUtscGZlIAUDO2aUUoGxHRLxpHFHPYOVBpJsxGe219FAMrbOP4A1qbfasex4PiPhVx4hc0tBSWw0TptVRsh7l4VCNmHCcWEY1YJLtb/dCaDbv16NJdy8x7WqwA</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYreNKsjgckYcHSS8UJEOGS1OArbEUB2j0POLGR9r9CkMQl/s8F9bLSlzuJ4P6yuRGeYvnXTQnWnfS+97shF1KGykpD7n9MNKgcI4J2X69GgRZ2KE7yWh9UzfmpRARPlwHkcpo1wbELEMi+xZc4XXP45bzSgVlQEBr9tnaIMGMs1vDvzrwRHAmD0/dvqtWSell4cQUjmQQ70uVI/02GmTUlJjFzXkJR9CADybHGefU/WYpAlTNDGhGceKT6XMzZMfAMLzXDs5Jx2Fesvt+I2av249ZDk7ehfpyXLlCLwbpsg75tedv4ckd4gXi7pg0hUP3TfduAu9jkGlWt6KFLGEEymY=</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="GetExchangeRate">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9Tlp8CnuqRQn1xMobDogEo7DkgYxScAEUVhmm/ixIQyZLlUjQu2qlVIk7fLhljtoDYD8AQGfiQaDmRftY5WVbwK8mR7p+/qg3nig7QeQB7u51Tg7CMbPj4rBf51gQ9twdiKpRSCnfrwtp0bqD7HSHqGFB4LkpMYZJuNazRN84cwxkXXcuu6UlkpkBkL4YcKa2Yk2O/Wuyw3ndeLJ2i7OIDS54G9slssi0CvLNIIjw6aW5hL72aJVzPA7oyS/ZrEtAr0elCMDo5/laNxcrZ4EJb+3sZYYb8Vwn71hqXtDCQNrxetiG8HdOH108m4vgMVbzYoHGjwaNapB6fP1xmPAVIZMCA9ynP4c8yosdcatCW8jLugyLWCIzLlkObc7uNysuLlHvPhM99osm2KOoGF/Qx7k</Encrypted>]]>
      </text>
    </action>

  </response>
</dir>