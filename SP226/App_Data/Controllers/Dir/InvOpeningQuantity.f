<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CheckUnitRightBeforeEdit "
if @@admin &lt;&gt; 1 begin
  if @@action = 'Edit' begin
    if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @ma_dvcs and r_edit = 1) begin
      select 'ma_nk' as field, '$NotAuthorized' as message
      return
    end
  end
end
">

  <!ENTITY CheckLockedDate "
declare @$lockedDate nvarchar(512)
select @$lockedDate = case when @@language = 'V' then N'Đã khóa số liệu, kiểm tra lại ngày khóa sổ.' else N'Data is locked, you must modify system locked date.' end

if exists(select 1 from dmstt where year(ngay_ks) * 12 + month(ngay_ks) > (@nam * 12) + (@quy * 3)) begin
  select 'ma_nk' as field, @$lockedDate as message
  return
end
if exists(select 1 from dmdvcsks where ma_dvcs = @ma_dvcs and year(ngay_ks) * 12 + month(ngay_ks) > (@nam * 12) + (@quy * 3)) begin
  select 'ma_nk' as field, @$lockedDate as message
  return
end">

  <!ENTITY k0 "@nam = $nam.OldValue and @quy = $quy.OldValue and @ma_dvcs = $ma_dvcs.OldValue and @ma_nk = $ma_nk.OldValue and @so_tu = $so_tu.OldValue">
  <!ENTITY k1 "nam = @nam and quy = @quy and ma_dvcs = @ma_dvcs and ma_nk = @ma_nk and so_tu = @so_tu">
  <!ENTITY k2 "nam = $nam.OldValue and quy = $quy.OldValue and ma_dvcs = $ma_dvcs.OldValue and ma_nk = $ma_nk.OldValue and so_tu = $so_tu.OldValue">
  <!ENTITY k3 "ma_nk = @ma_nk and nam = @nam and quy = @quy and @so_tu &lt;= so_den and so_tu &lt;= @so_den">
]>

<dir table="sthd" code="ma_dvcs, nam, quy, ma_nk, so_tu" order="ma_dvcs, nam, quy, ma_nk, so_tu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số tồn hóa đơn đầu kỳ" e="Opening Quantity"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="quy" isPrimaryKey="true" dataFormatString="1, 2, 3, 4" type="Decimal" allowNulls="false" align="right" maxLength="1">
      <header v="Quý" e="Quarter"></header>
      <items style="Mask"></items>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" allowNulls="false" dataFormatString="###0">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nk" isPrimaryKey="true" allowNulls="false">
      <header v="Mã quyển" e="Voucher Book"></header>
      <items style="AutoComplete" controller="InvoiceBook" reference="ten_nk%l" key="status = '1' and ((ma_dvcs = '') or ('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and ky_hieu &lt;&gt; ''" check="((ma_dvcs = '') or ('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and ky_hieu &lt;&gt; ''" information="ma_nk$v20dmhd.ten_nk%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZap80GWXR5RmNrf+w3eOCv1E39zld5zyAECffzfoGhJO3FCcGhX8X+sasTTdhe99+hDJh9380I9z/xqXPSmNeFA=</encrypted>]]></clientScript>
    </field>
    <field name="ten_nk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ky_hieu" external="true" inactivate="true" defaultValue="''">
      <header v="Ký hiệu mẫu hóa đơn" e="Invoice Form"></header>
    </field>
    <field name="ten_loai_hd%l" external="true" inactivate="true" defaultValue="''">
      <header v="Tên loại hóa đơn" e="Invoice Type"></header>
    </field>
    <field name="so_seri" external="true" inactivate="true" defaultValue="''">
      <header v="Ký hiệu hóa đơn" e="Invoice Series"></header>
    </field>

    <field name="so_tu" isPrimaryKey="true" type="Decimal" allowNulls="false" align="right" dataFormatString="### ### ### ##0">
      <header v="Từ số" e="Number from"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZap80GWXR5RmNrf+w3eOCv1E39zld5zyAECffzfoGhJOmKpupPDrPvo8yGxA6zw2FcF1nQbFpC5DPvZyXCwbzgA=</encrypted>]]></clientScript>
    </field>
    <field name="so_den" type="Decimal" allowNulls="false" align="right" dataFormatString="### ### ### ##0">
      <header v="Đến số" e="Number to"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZap80GWXR5RmNrf+w3eOCv1E39zld5zyAECffzfoGhJOmKpupPDrPvo8yGxA6zw2FcF1nQbFpC5DPvZyXCwbzgA=</encrypted>]]></clientScript>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="### ### ### ##0" inactivate="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ct1" external="true" defaultValue="''" inactivate="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct2" external="true" defaultValue="''" inactivate="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130, 0"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11: [quy].Label, [quy]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="1101001: [ma_nk].Label, [ma_nk],[ten_nk%l], [so_ct1]"/>
      <item value="110: [ky_hieu].Label, [ky_hieu]"/>
      <item value="1100001: [ten_loai_hd%l].Label, [ten_loai_hd%l], [so_ct2]"/>
      <item value="110: [so_seri].Label, [so_seri]"/>
      <item value="110: [so_tu].Label, [so_tu]"/>
      <item value="110: [so_den].Label, [so_den]"/>
      <item value="110: [so_luong].Label, [so_luong]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5mXybsIvOX8+lnQmlfesIjw3efb0NmpM2a7k94PjieBEphWGJmzBDT0d5xxlVkO4FYZs7xM3d2ASso3+X1nptNd/8kGu5q/EMy/HDWf1c0U</encrypted>]]>
      </text>
    </command>
    
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1bZ6B5atbZg/+vHOz7SdC3Ed64LNS1uJdKN/B3Rm0RxrnZ445VO0P05kXn80uYEr3jbCEMoFaMTINF7G/W+xqw=</encrypted>]]>
        &CheckUnitRightBeforeEdit;
        &CheckLockedDate;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KtANaf7DC8MZp7vrMg68tn6fycKBF52oSi2tITQ519VweC+YD4yg1tiEx+gIjfKkjbQf3vbOAEYhsLaqS3Dk9Eg4tTFEUmlsCFkqgtebbcZLON/xkvZkjy0AQrOrWlJuQCwEt/1rd+tFGXQ7DL+q6E7PhSYRfuTbLhValG8vGgoalQ3RDjBPV7vwDirQybfVkbgVvEpks1vJR49rXt4qL3/+U6rik2EAM+Zjzvh1OldqkL/0wL8hIdMkRhOGHejS68Ws0U4NCcvlcKJWosI3PMD4zEeH/nP0E8utk/bexnXCVdOaOSc7i4v4nftGSHfatmiSsRkselBF+RCrw9e573IUv1Zs/GbH9OOwlPxliAxM</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1bZ6B5atbZg/+vHOz7SdC3Ed64LNS1uJdKN/B3Rm0RxrnZ445VO0P05kXn80uYEr3jbCEMoFaMTINF7G/W+xqw=</encrypted>]]>
        &CheckUnitRightBeforeEdit;
        &CheckLockedDate;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KrvciI4aZX5bYkN5zvkiaABEuqqu764y9Mtcig2LopvtLqoRUuNVH5z9eYKRBmtucfU2mqU+/zAQrf+BpeRTDFwYB31iVGPmwZJ4ijLY7Fyj+vG2u2yF3dMa3UtQ+RJuNg==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf870RRmK3iajHWXRFtDyQdW9ZkhS2ARznqC3aW/RgCJHcIlrwjOYFNcNo6jZltho+VSnNl6rkKlzF6z/bEYmpkEckRSyF8PSwaMfoDHHWHrY</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8z+9nOmCWRvRw8v2P0ek3K9RjO64cugpp8TS76L29m6Po7B335Uw+pGoUvWX1UP3QDclkEis9HSsBQ4+9b8t3glcZ+5+S4wPGLAl0doJeDlezs7AJOe4/5OUVYmSfqq0A0BdDsKBhZ5mNgqI02MCZ8Ugs1+Ot4Rux6T9orWy8VpD0ZIP+q1Fm10wqIWHoav09koiY4iPuB8FM578XD/5VQ=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI4hEwN5Hy9asCNdVnqKPSum+iJSlCsN1dH/zF67zmztrQ3rn2CspKXNKQD2yZzfShfeP9GiWPWWnlElL7pW2RI7qxvLa9peFUnWXeKjACGqdWh8XZlRKv6AZ00WAloUicd4r9fDkQrN2VnREvt+ewh5/j7V/oPF1xKB3RdABGagovAxG85H75naDWVV8F1IXdoG2K3Y5X43UkEsmK8b6xbnjzX0xBJrANmRZT91Uhikf0MD/b3bOHVxmi/WRooSkXapzhkRBisftv+XGb7/EtW/u7CDog7g5NUsc7nimcS/m92DPQEc0bN5MVb/QOtbseWh/JpxOIa8SXktjoJMlZ5vPBmDC2Yns3Sx5zFGQr37RU6LedG/MxT5cei9tN4z34OMM6Fb9uBsOMbihbaBaalzGBGk+5q7vSK5uCfCYjGQgfDUYT8fBHI8aBX+3VaadHYcIDyzcIrsiS3unuGNmd0w=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CheckLockedDate;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3chGulZx9js/QAMlXiOyoG+w==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cBNQKAVD0rz4NeAv+Y/P9MonPU1VuUcoIH52dMu8nTxFRnneAfW/vcqhYHKaljWBvEH8HudZ8UUGoGxvLj2C3X2N8Sv9M5PQdXRB7xqcf0bhy92PIRbyaezlRJxSdVL9tPbRU8NSLor4S1d7oll/T4A=</encrypted>]]>&k3;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cCSrQzZX8Fur9M1TK0M4A6OngGUAlzbkGCMx0J3EqJJ6ICkDDmDmDySVG2zfR7gaZ9yDn7ADuAN/ir1Ryx4SaEEDOKNWnmUlMYT1ChAdQF37g1WZjolGXv4gaW/8uXK1MUFSG6veq0RpK/o4lk/CqvhTbYv0cD4Jth3bh6fs7f5t</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHIfhvN/FgzGs7XWCpp4tNw==</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cBNQKAVD0rz4NeAv+Y/P9MrT9Xpr0Mx3wUXt/W2dxr8JcxgXUoKkIJJNqkDarH0YOt9c1IUCjrI5SPoiU5X5MRv3k3fSp2IkWPhNS0VKAvdR</encrypted>]]>&CheckLockedDate;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfytvb6M6LF9clAvewQP2kjB9e5/rHiaMFB5+yaZ2vC0D</encrypted>]]>&k0;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN4/gTNFFQu0uenpQvEOpfKo64C+/GJR6A+stLGmvWCenQWjmiZXH5Ms/sggehN2p6w=</encrypted>]]>&k2;<![CDATA[<encrypted>%ShDm4LooPFnWfxWGAKIehxn5IEU5hwC3K054s/5gYTI=</encrypted>]]>&k1;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYWWHuLa0v6wt7BSl+2b6jiq84mCuxI/LliYd41J9LaRBWB0i2rX3PZiD1d2SRMfhGaiaoHgEdyHY/be/ql6IHkvnPC8iGJ+HEG1yZluGhD/qqLauiWnClZXKF/3II/qWHYfjgl8V1Lk0Vj/r6rIJkZA=</encrypted>]]>&k3;<![CDATA[<encrypted>%LpK0+C7Z27eMbRoQwsVpHXUZPhZejoSanSW5VqAEj4k=</encrypted>]]>&k2;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYdqomcxbwSn/XO2BKn0O9Fw/+HlbdLvbg2VlPgkOhPo7TdLzBftHV4ygKupSvLekJc1z5B/CN59vwbIVaumzk8GyNnZ4/Kdkttp4HjpFDq6I</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqMboCxcWZPqmgVHI4rxdBdE5v2XLyIc5gSWiGIG4xro</encrypted>]]>&k1;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBrXTsjgXN/rsYBse7f05JfYG2Xh2YzYvu+bYqiQss5c0MtSujDvHbPR6ZKXJ6B15LbbKEleuNt1hyYAAZtSCTrG89itM6lQ3/C7HVXDJu0iW1F2SfnFro56UWPTSep7x3qQWtgSfj0k+rkXhTQC6z5qIk4iu1PxFehPwES7lhoe9g==</encrypted>]]>&CheckLockedDate;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krhl46OH701sAJ0MiCdr1ukkCptm5E8a+Q6OerEI7uCX307xjEgBa9ezB+mfY/vHBUFTVde3AKIAv3JTGAA+EreoVsMQUuReKuKgRttoHnedNVeQ8qBN597TGq+tuhtmveIDx44tb4/kXs6HCgT4z2GSpmFCCSfWXmBhxbvtNTXH0fXwrkAjCoFrXZmqSMMGqz2AAboceNGoSwK22kY6O4B4w5tFOiIMbxKdn1SebKI4wxJ4280xJRcyfkjDISvQ1LRtDt4kqb139SL2UE+56Ygw/ZKKA5cw4rtxDFwEf/ugUvQN6U9cmNhhRapjE7Ux5Ds/D8uY5dMwuhiE1GqUb84mhmw/nuJ+MfRWLbPtLdfp7tOwdOLCpx7LIYyFJf7ago4bycj+9Dm0J7li2TWkUS2fzjOW79/FIZHQnh24qR4OB9BFJ4u6v2quj5VoB6FkXwzGL5Idx5fD1FU5vJF85kRdkICcfvB3Xnymdjdbe4Wvxk9uhgbW82qu4ASV+T1OJNr/qRvBnOBgpjmo9EBD4eAiauOAf/zpX/5LXwypQ1UMsIJJtAR8LM3gjljRkKpzdb95KfEm9rnkM7cjsFUDBhh0E4D6bwoVjW7Mzfr3XoGnrPsdPUn/vrPrU81II06N5xeqxiZMsknRC5YtEZhLcQuP2O/F9kSUu6XFIu+0ux0vvxHvf4LDc66pKPBS5YH9cBpPll8n51D+HzHnuUFDPtOeDxgLUTYanr2Cg1MU247PKg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JL0pd4fpjnurIGU+iC9f1H77KkbPYeEQcDdX4ZFzKM9Og3ROHp2mIOOTw8ZAFOxjpubPyhWoGl6D7hQj1fZqsSIg/CDvZr2w7qooFaVuVua6lGVQFT1dHvSKxl+TusDlrwVSCxIr6dG2xRsQzIRCN8iIvCjn5KbAtWsQEP+KJDOPtxg5kdepiu5UEU+/HDRw3yHKh0kJ3dtr8VQBxLL9oHnTkKxmWBcoKfIRASUG6kLFF7ftBWiWNkhyAlQ9LRUQ6NnSjmpixzGELln0U1QQerY+5FpVFuJtJGz3MTO/kTSI1tyVjoEyPbFqEr6Y4kayd0MwmZ2wly+TByduMGqJZx9Ds7QE/ae+dP1vwiZnUm9RF0Suu9uvgNqWo59FziV00ysVTMaNAO5AAdCRraPR15NDK59MBBm+Exq+tl/526xStEM4/nG4ai2YCFLvJLRXlrnDYzrDqQutKRAHpdw4Uwc+DN+wczjq8eWgzLK0wT0tVzr00Q4WUbCHWDQgghVmU5uOSYi622DVSq2srW4dNtM+BoOfbkK4538bITN8sUaxu1F+GRjcdyrBIBHxmZsQ06Wl95FqpWoMD4t2BSgVWKeQ+afen5D3mDM5mYjdZNXreyJmdwGNGYD8GifvjbH4RXj3WNttvar3XZbL83Q+ZdPTbHrMx+e80/7WO1oJV52UIymi/51uCjhAMJhgOGc6ImMo+GNNYGxLzmJL/q6eihBSaCdMk8szLT2G0D+u4/IVKokIcdRlbVGkYpAn6XXwQwH7wQvVoenBypxrY4SZ5yaZ43mo5737d7vzn/NJAKsqgYGMmPYNmchdAXJnGOR+4zebWVYAjC3YMfp5zh2VM1xzedvO6+BytZfvYAREpq6dkgf1aK40+xB/GOnHqZwljjcUSIuCe1HYmidEFeZGFTv1MOwoKAJSXWQQ2FhhEX8nGiSUGnWNHRM1Tr0s8+yZ3vVPxYhXSQe1JOpJkU/obsZBb3biPLMvRBGAeqognyR3FFMne0N0CUz1/31ugOy2PFyrtKQz9c0tfbdSVZuP1KqmUhv09I3LVVpkGPjvvwsvoPh5cDsdTc8h3YD5WEJEErE7kbAr2V0iTKkD9rNgGtxLk3kMoiLwWRNbRlbRkSx</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="InvoiceBook">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6hJMsblAA4i/UzOiJgtoTfuO5+C+1fBPDlFHLew29sVdwMlgAqMHc+y4kncGUzuUqjsXei8QBQFR3AXFFiXIFaAAngjjxVbQgsZD4XfAl7BE0PXFyT6GvR+xLHmC0S4Hfb8Svcs7lD8dLwayDqHHT+BNXILW/wdPUiDP5vs+FAILPtzBJhrO3tdoBm811bG9n6ejGx11vC2ijIBH8rMZE4RTbpuf4SLsosUOLa5deQCvxFgQf6MYJHYFdVmrcsLPgyaObKe8R6fL9ZDD9EZKo3Ei7AQ3xPUjs42DXsm+gabw==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>