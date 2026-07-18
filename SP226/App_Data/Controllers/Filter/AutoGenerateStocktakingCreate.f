<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tạo chênh lệch kiểm kê tự động" e="Auto generation"></title>
  <fields>

    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tài khoản" e="Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and loai_tk = '1'" check="loai_tk = '1'" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nx" allowNulls="false">
      <header v="Mã nhập xuất" e="Reason Code"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1" information="ma_nx$dmnx.ten_nx%l"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="ma_quyen" onDemand="true">
      <header v="Mã quyển" e="Book Code"/>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_quyen%l" key="((ma_dvcs = '') or (ma_dvcs = @u)) and ((@d &gt;= ngay_hl_tu or ngay_hl_tu is null) and (@d &lt;= ngay_hl_den or ngay_hl_den is null)) and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @c and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0)) and status = '1'" check="((ma_dvcs = '') or (ma_dvcs = @u)) and ((@d &gt;= ngay_hl_tu or ngay_hl_tu is null) and (@d &lt;= ngay_hl_den or ngay_hl_den is null)) and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @c and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0))" information="ma_nk$v20dmnk.ten_nk%l"/>
    </field>
    <field name="ten_quyen%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Nhập kho" e="1. Receipt"/>
        </item>
        <item value="2">
          <text v="2. Chuyển KTTH" e="2. Release Later"/>
        </item>
        <item value="3">
          <text v="3. Chuyển sổ cái" e="3. Release"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="stt_rec" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="type" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" align="left" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110---1: [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="1101001: [ma_kh].Label, [ma_kh], [ten_kh%l], [ma_dvcs]"/>
      <item value="1100001: [dien_giai].Label, [dien_giai], [ma_kho]"/>
      <item value="1101001: [tk].Label, [tk], [ten_tk%l], [type]"/>
      <item value="1101001: [ma_nx].Label, [ma_nx], [ten_nx%l], [ngay]"/>
      <item value="110100-: [ma_quyen].Label, [ma_quyen], [ten_quyen%l]"/>
      <item value="1100---: [status].Label, [status]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMh9W/u/PWX3uj7WUu4cEfbI+HdhR4g8RD03c4lORTQp0vqVXkBdod+EhePnCx1qx4MLyYicF7xnuEZoKlx4PjcHb/G0JFfwG+MGqcmFU9UW</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFC0f6aKQ6P+aBE2M+Rt4jZqmLbcmRefjb/MFiCuWDPVcT1dEpsbvxgI8m/zuSQ3GpAuZv+57iBPZdY8NXduby4MWD+Bu1Gv9qU0C2elFTXb</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EcDIe+Zgaq9K5PJOweTML4W/lPAXt2gveZ2Lscy+uC4VP5f3G5l5vbbBD0KBCrE1V4N2FUo6TUUfhhHLn7u47J8Bl0V2sMYUbmyTgxwyGzlq5ZsW29IEKIjnZhIRJr2fDlyeNgno6gbqMELDaTADBnYLz8yzxiGhR7Or9OXU36vMBHhpwpQwwkjdrNcmyGoFd+N11QsV2a6py/pvSkRJv3KUa6z8nOlbpo7p5JgHWq/wA5QdW8BKb/8EfzaP0YDcBsGPy+XAPE5IwoaZsmlrxKg4a6Tto04Hb8acaAAszpo9</Encrypted>]]>
      </text>
    </command>


    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu45ozvts782k3EXgG0Wjr+IFfbSBZC1iJpLKLGswGjKjPVPxyJGc82oAcr+F37NnBitAzq7zaQmDddONjX8VY8eW6FrA6cd5M95zWUrMgmsF7J8nHTqrUGAnI9Aeb8/jDrO0VXW92dvuc5ylqohxLo0WKDc4spMJINXuWYOop8GPMN3mC3Nk8dXLDbqqtiE3XCAU3e+q8X4T/r/bVvWHNi9y2tI1NeToA6Fe3d7I7WAZcd4APEm3wcCNUUNO80gG+hQZFU/imJJYqTjGDgnWl2GtJpId6X0MHkaQ7O3J2pnEk5VRVkG7vI7k7DvykzegZGQbwrG9Obj3GIqq/ZFe4+YQFUkc309dvOHnwPox/d5fxRPj7vVr148HKUchPllz5Bz7JOIA/aLUeZuqappVba7fYyJNgQNZGXOjw4hCKL7E</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtWIWBFwRqwe2kGfgA7NVDCv3pFFrcEu2vm88DO5eNi4CRD3YAKNbKJ3zX2oIJsMoFiGJbJp6clirGFzVIsSlCmlV+8n7Ph3zMfT0ryWQoCnnQPD3UiwXkW5Om4SGqofp5bu1Rp4lBt8rwU0Ni5b/JNjw+LSRreuC1+ALx3HTioVfIIoxUV/r/VuNZdFpIztXs+sgGVg2GScRqLYaNscM9LQSqwznNn4SxGDD/S4EYfobsMnx/DtHfGe/AqMA1SdjYfZ0TFEQtBrskb8xnE8pcR6qF/43+h8hJi7x6oQ9x26C19WEljk7ID/UTSKEcaXeitQmDoNTa8TyY3u0KPlJSMHSjpS5c9LhwWT9I++gytzocs8mE/lia5YWwfxZFgTNbpFI1qjGbTkyXBT0dnekCgvbIgy/Lnt1RfMV7j2O8C+DeA647GOWWvkdR3b8+cBgWY/KWl3fSsX43rr9umgYAvtnWR6y0bq1XJAS2HthCRjYoLwTNWrgflD/7xktS0xgFr3OaNsv4jkxYBtpKDPN4mqM3j8VIwKMilXYWIdhrL+OEgfRVi403atv7zy2FjBUPq1hfcu7LtR1k8JefETPP5UAxXtHs4+GrKgiqHLE5B7s+gKJkdx+6EmMEyrTPZYTUvE7UAnfzJxWv7khoBLjpKmgqDQsEMvfOkz+ixnINIBwlTSGeh0QFukQE52JG/TVrd48nXNEbsm8jxW5r+pW0KKiob20dhQ5NLdsjRznSC9l/1OXDn3vQP5dVldFHIsES0icMo1yaCuhZnqpvGDRRnemGKzkUdZV2dkWbmBryxHEMB3y9J5vahsNGo8c5831XJO+kQqZPKF6Rv73TaQ27ha8bgxjarprLJNgPWR7y+MgDzTd5/sGeEQ46POTLdfa+yRMtxDY8+59w9MVXE50fNy3tPh6bTZXPjw4oXa/Q8D719Pk6j1rFRQWc4cZzl0bo0cyKNVH3OvJ0Aqta36m6Q70ab5bEMHSwH9wYVAmzlTFNTJLi0aAxZRjiS9P6JfBEXLlQ8MULAq7Vv0+3OQUp1XNvBPOekTOoDn0Ps27/X48nSMywr9pXELSPujkrQz299jZva4wPrxnyXlgLAnQq+hkDOTVraA90nNlKc+GwdXus8OVaIo7eVoUc0HgH7NsAOfrrPvc+FAiqf6ckfnbuzpiygUFNSjWl64NmSKOIiLhO+3cIURXv9hh6yj3gih8bA==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="StocktakingCreate">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5uz+crNC/m7CdekOqzNrPw5fj6JcZ0XzJTvaFBvSwCysDkYRgYpZgzVWwFqixowJ903eBUTfvqnp6g2jH/dLODx/HwRyEKdM8RxV3EKnG2W2zFRywuGPN0wevcFeQR+YyX4hj1myDELxWk4VYeQ76Fe+s0dacWNU++xtf0BiUEgsMdNcqy63Q3KOZkB/6uutvpcHdEYF2nMlKEdzuAvXRQ+gz0ox2vkEEoAW9D3DDzuWqbjO4EbPeZMJXAfIOoC4/zUe39q6EWNqWEJKdRUg/6PS0hvupMdUsG/SDuYAZhw16Kpj0T5j72RsZ1gfajl4b+jfr7/B+ct9bUEW2xqtkYU+wNQX65y0aTwSlEQ6L0bENIkHV1/F1DTWXCjKLzOSlBMN/7vF13LM+I7gi+FXaUrk2VlNJ6Kl/M97dzOhcaa</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>