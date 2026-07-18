<?xml version="1.0" encoding="utf-8"?>

<dir table="hrca$000000" code="stt_rec_nv" order="stt_rec_nv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99JaHbgj9Egy1cLU1R1asVbEjfGIt90YXz+/6KzodqAhz968W9aNveT+WoCBsHYrEOVDRoL2jkYfdNpfsEalez1U=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_bp%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Nhân viên" e="Employee"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten_nv" key="bp_ref like case when '{$%c[bp_ref]}' &lt;&gt; '' then '{$%c[bp_ref]}%' else '''' end and status = '1'" check="bp_ref like case when '{$%c[bp_ref]}' &lt;&gt; '' then '{$%c[bp_ref]}%' else '''' end"/>
    </field>
    <field name="ten_nv" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vtr" onDemand="true">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" key="status = '1'" check="1 = 1" information="ma_vtr$hrvt.ten_vtr%l"/>
    </field>
    <field name="ten_vtr%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bac_ql" onDemand="true">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac_ql%l" key="status = '1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bac_ql%l" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="bp_ref" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11011: [tu_ngay].Description, [tu_ngay], [den_ngay], [bp_ref]"/>
      <item value="11010: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="11010: [ma_nv].Label, [ma_nv], [ten_nv]"/>
      <item value="11010: [ma_vtr].Label, [ma_vtr], [ten_vtr%l]"/>
      <item value="11010: [bac_ql].Label, [bac_ql], [ten_bac_ql%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMUMGaUb9sqzhcvJsBEUvrjqEitu2RyQOS/08AO/uqxXcEzaQtJ0lVJseKFfbFY/t8iEDvMi39dhCKg1AZ4sqpbOGktFk/R5fs/gZrgm39YH</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMt1oHfmSZ/Mwp4FHr/BqIyeMPVL+adAOWwEXWIqKK+3fhodm0VPUHmz73mNW8Nf/4liXe++zNLORIhYQhvoCi7ynWalUNJuPUj2t6klzCa2</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9s4lWv7ZbWWVWZgmQ9EZntmyrcA2uKxRV10Db2rczyPosWV7SaKBXT3y991bPpSw29X71CIN+w5H8xIJy3Q76I5fbzZW3PsoRyysBcu0stFHpiIZo7AAqjdlbXS3k7hFEHiIscBTlbgu4tHlh2v8U3PV9B7TyTmQNSO7X7d4ALzz1Dg7az/7iilEFqjTKz1bEREbU6YLCRHkk6k4jUZukcxJ2OFbKTcqhIqj+xz4IfAy5kN1RJpZ1l2BvGD6D/vcGz4D+ofkVR5iRYTJn3xwt7dhpMff57k8v/HzBCTrJGxXzZbC1bpjRLbzNOjdxCNVlVMXT9X75+IZAWVPOiYGpjDcA8CG3SkmYmxeFZrLd5lzSYGmnMJ7SnmDI1w+vuaqKxWy6N2SelBEswSaqE49ZycG0/I6nJq7o4rkRHRR0JPouZBJVtE7ckB/SsuU/4G5UTkPEqTAyUU/SipydxnlaHAwCfFoZcKFKboBk2rlCXRRAi8mb2fCVHM9hvJ8sCzAdOybtWnsIphRCH2XD3rarsw8yH4QJQyyvLAKSWzfqK+53adZWEtc3kXjLRIeWzqlCvyZg9asmdvzi1nmggVlcTzFxHWRPn5fFv1+NHc0rbdEj8NM/APl7Pmnk62Z75wZM5J4Zg79bntwzhqRh1khKtedrqvc9uSKIJdZo0YUdg6/JiuJJErRRSLMP22tQh+87nnfWTrZZCbtWs+HjxlHKOZCMaqKbiCycWlQOjSDKYfeSZweVH/kAI38okenMA+rYrgPY2rAtqQ5qUfXxqQoWKcCTQg2VM6a39hsaQeyHo5ciKNa/yPhNpHrTSWlv8tA78+RLqehh/OWYAwRLstrJAMBMbN3B0GETIFgfMv9mMOzvngyRDyfsFyTykNWYeBoXwnGmA9/wNtT9ahORTA09+27C76Fq9VKpuw7ky/7jxO4fPKADVnS0kGsEkOLpXgpAyLO1AHYXkKUyrRv7YxcdZrr405gMs/DtHUcIgPhsM2nIEPH10/sLC5cEkuKDSdw7e5pyl/iFd0ypjJFWIOLWrZzPPEn15VqM5Vr8/hedulBl+gb3AITs8KXZm5m5Fc5EUBIaHqjIEX5gR/2sOSzSD5PRSkFEK++QdDzZ9W3vy3KeTrYwJHut9cw+ui9BACbFV73LFZRO9XUOpTSHJUrxw=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtZ4U1jXLSDdXIUZ789fJPaR5i4ryX9Tabvz7H08MBh4rYh/T0LcG7KMW+sglwGbHjv6Sezh4YD2MLyRtFGuUEJPonxatA1CEFFewTAMZW0xQ2mg2OekUU6BxahiWvpJZXXbu5itu9ygx8+1GhrDprcANgts6EL7iUPF8HfYSUi7hKtk4VQPv8mSUISse+ScUJwVy1N841KeJNFglUaGgMG2x7L4B955/1RZ/ytpx9O4Uxg8t2H5t14g/+y0PruZeHtd5WJzGoVmzQCLf89cHr/83gbo0ff4EGOc1RaB7uykdNcR8C4sTmcVshvY2EYH+82BeNIMf6OxwEjGtuVEfhvrK41uXq0hJpft6AZfyaXMtgU1yfbZDkNihrnF9fovlrrxZghVfR6/QmJXnkpmhUO9/QN2Pb8MtgmorqLaNciGqgJjKDvlP+MJUTfkzLjVAgx+SsZ+RRDsVgpYkhwwpiDcpsBkjMn23/s2MIbLscbuChQRM5Z9XiL7nF1nyxa9N3FxGMmKth6szp+GqFhwurNVxGuwJz7//ClPYumzCmaka7v5uTESW2E25cCoB76GIIHdoapzA5PfHlJ2gg42Yvrtnwvty6+7mprCPY1FuhiT9jEVXY6plJVH9CaBDdMxgG8JSQD2GFz2xEJgutq9NXy4a5RMLNMz6pbHOvkdWg5dKDgCGvlphezwB6fXa3v5aipbSrBmMAMWjtmPhkb/K8Nt1SEJX7ExH6838MZjyruqbJ9o3YqGIp0WaK6woabvYrR/2Rx8Hz2aQlocPDfY9p+NXueFn+MNYPy0zxgdHNdmHLJwtOTlQaQzc0RMkTsDG0FKlkg51MBhySHFo0IZ4phsbvROu4vlNI75Cy3Tl4y6OTJumVvNTpiAekaRpobL6bPrTdpezcD+1pw8bCqoiQRQ1Yh8zgtLHsVW6lUWtOuElLOr9pJh5UihtWJ5xX8NuVW6DoDVYj7wolNS/ZvQNcmG+CWHLg9AvaSQAcpqbtaUARImC0Msil9omomj3KQGvITcr8Mo+mF6Mp2Ej7dm/O1W5HdjO+usIUuVI4rhPYUFkkPM6XNFRM+PNsGmcaHFOfMXqbQqXnPCuma39MFYuIqB9A28Xhf5B+UZDMskpbYuJo5DdUrR6ghWJI0cLGQaJNdticJQ8dTcRTKlajtVSgrX810fNO20/EM0xVdbJp8PFhCTAR++XCwxxv04Nxo7SOrskP+3bwxeQlInrdUikDlgxNxGgrPkWqmpm/SBxQCxSEAcDUl5gY5kAwn+Zqd9C+KTYZXcMtHaHZdj2UP+66AQPu83cvfKLiec1tD8TEt8Vm5V22fiK/OrBPBcZ6/pDNd3K+RYSxjdAWZ9KIaQNQJ1QFnUVR51e4Mr5G4rdLNUAjJPQXIRDfmgJbIm1Q6RkRsTgv3Yh3pffPqC3vGFim0lcLP2q64B27i3REUQdiTsm4phhRl81oXp8pU5ZLf6+GopLjlYg+vKO+O6D542NQ8MYFCvOY+6CUeoTSHqggkCkx9HSJM6r72QhH07nNmEYNQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reference">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/oKUmX0302sbDhc8SCfv6qyS+57AZX9OCiqrO8xBUUDDla/S+iis315fb8H1wy3bNUsmpPt7PJrYyq6X4mptNXjcFyGHn7ULyyUhvtzCseRpt3CjnWiqfqOjLJwVgVxv5ZSG2cbrDxt6xVHUNtAF9o=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>