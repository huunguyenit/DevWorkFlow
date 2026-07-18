<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandFixedAssetLockedBeforeEdit SYSTEM "..\Include\Command\FixedAssetLockedBeforeEdit.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\FixedAssetLockedDate.txt">
  <!ENTITY ValueDate "@ngay_hl_tu">
  <!ENTITY FieldDate "ngay_hl_tu">
  <!ENTITY FieldFocus "ngay_hl_tu">
  <!ENTITY FixedAssetTable "dmts">
  <!ENTITY ExternalKey "and ngay_hl_tu = @ngay_hl_tu">
]>

<dir table="dmtskkh" code="so_the_ts, ngay_hl_tu" order="so_the_ts, ngay_hl_tu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="khai báo tạm dừng khấu hao TSCĐ" e="Fixed Asset Depreciation Suspending"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" allowNulls="false">
      <header v="Số thẻ tài sản" e="Fixed Asset"></header>
      <items style="AutoComplete" controller="FixedAsset" reference="ten_ts%l" key="status = '1' and kieu_kh = 0 and (@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = dmts.ma_dvcs and r.r_access=1))" check="kieu_kh = 0 and (@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = dmts.ma_dvcs and r.r_access=1))" information="so_the_ts$dmts.ten_ts%l"/>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay_hl_tu" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Hiệu lực từ ngày" e="Effective Date from"></header>
    </field>
    <field name="ngay_hl_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Hiệu lực đến ngày" e="Effective Date to"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330"/>
      <item value="111: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="11: [ngay_hl_tu].Label, [ngay_hl_tu]"/>
      <item value="11: [ngay_hl_den].Label, [ngay_hl_den]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZqLQHvIqLTJUpo+DWhlymlb0f7glYOme62xjmIlCmOsw==</encrypted>]]><![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1bZ6B5atbZg/+vHOz7SdC3Ed64LNS1uJdKN/B3Rm0RxdYBu0DMiqdQsMjjgYRFUisdo15rLYFLCJ/aXiSzcRozg89JY4OdIbz4Pnat6qvpedVQYdEeyaKKuI/jrpsHlKR7mwoiLIcEEON4Wowrs7EUdD1vcwzoEeYNpAKnGKe4IPRFqAMVwAoFHyekoe7yeMIy7Lbp28maGLaisgSvYZ2jheVhNs/2cshjqw++G0mMFq8I9PURUC87xlA74gBm70uasfenAcA8IKpIKIC9hKjh5W9hQiBpKxgeceBNMB+tFy5mrIL8Y53IFLpyD8YMxW31mXlaBaSMKg1IwC0vs3c7lFWJZS4MEX8NeBd1f10Zj2hWXu700ndUdQQtU10igWg==</encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        &CommandFixedAssetLockedBeforeEdit;
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSd015zqG2qd8QnyqXq+4m2hmCU0hPnjTRLZ8h6OLH2iZqvbwQAoQrjR6faDN+cQwb2HTEmM169nxsm1e30E29RRgBWxw8fDVQbeFH2EKVbMDpeSZmyi27gwBMe2GAwmliFn7fXb4Ct1Fh9/AZ/s2dCk5HUIsYDVd0mxkx2HFEyhKNSh3nby4avoZF0klJUtxSiPf+p0kR4vR2i7i4SsucP3sLgX4lXvDonNrCuD4SCXJv5hgb8B89mnI1OcO0nZBL99PlUg2jola1YR23Xe3glYXDH+aWGB5advmFPecyaUCOUE5K4HVw5qcMlTfJlM2V+zfw7c51urT/7haP2f1tHTuKTY9slnQkuiG+iWp4TR9uGr2Rv8PYm0Eit5ytjgIRGnS4uedc9So5tmTNOPzXhMW5wobwmKrZ85HOT4n5qRdPKMvyi722ZxZC9z2SHO0BXoxlrj6A1cEoHmCy9bZDSUvyaTHt32FkT3V9WATNg0iM+WCb33Hwuifswmsd3NufXulIGTGSQW8L4AJjX2BiKxHwQ6wQ0zkBT/YoqgGm3+xllZ7m795lqhIcnXM6VhjwVEe7imGT+RL1STqqd0uZu</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZIVmedGuaHRyfv3bcWGMMfmo71C1q0UXGvBzqp3EdTAAIdFreDUOiwiYlz6rrnO6HgtALhKjKxj/KgzGwFlDCL9+Not4eOkik+8xwj6LZVWLJa6POE9mP6tagOc7Du/vR5Aa8rOT9Pd60J+wi9OxWaGQE+8JsCJC+gCe1Y6dy3Fkvb/S0guq8Qmn+xi7TdI/5uAsQLhOg+WfKPcb6Vl0KeTcYt6iceAgzNubZayadKpBfg60nrheqaOrIVRV+ZyYnicnNK9tFh8uJF7rVDMW2xmk2BPMjVlmn0HMmlVh5aFg==</encrypted>]]>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82ni801LKI6kW4s7CWteK+tRxtY0T1t6gcGGHrqGmkmV6fBg2+YXYf4QY6Cy5XgSJ8gWZBYf0Bk1lblqEpTH5/alB4Rqwuyr3mwIrDDDcb3Af+ReCAwMez9oL7G+SynnaqhzDCVHY1VyRKZFkcu9FNIHaXK8MPmsDhlplLDUsddHfMjjIvQ5A4+OIpShSgPMpZE4EN5jK8WPPzWGspH+GQxOjlhpVp2CXEUpnpESEISNNtYSUqr1Jp4c//74mVzDrEEh1N+aibD7KlZQURm6oBLC8MC2Tr2pxzfOUAFQW1x2VLtU1Anmu0d+nVFoUKdTaXVwUcFX0abHvSxYc5fMaY26A==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZIVmedGuaHRyfv3bcWGMMfmo71C1q0UXGvBzqp3EdTAAIdFreDUOiwiYlz6rrnO6HgtALhKjKxj/KgzGwFlDCL9+Not4eOkik+8xwj6LZVWLJa6POE9mP6tagOc7Du/vR5Aa8rOT9Pd60J+wi9OxWaGQE+8JsCJC+gCe1Y6dy3Fkvb/S0guq8Qmn+xi7TdI/5hHeORygFmJLjkp5rXim/ibg6LyuQdOYcG/bqI3QhusgMXf1DbEl+UVcsMXR8w332Sf0RhAO86ZmPQOC/MtWu+ArA1HhCZOA0zFNzWvRl0CA==</encrypted>]]>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jGiVBTTB+Ft3JuMTJj1btljeqHv+XMPWQr9lpa4HuluzgoTwpNOEe2EtBVnMqCzrZCCYHiXltWypeZG6z/n/y8N7OTk5UbyFZBkjbjfEwIsDlDvjoNCrNVDaiq+zXpJUAdElQj+/jCKenmvvU1/aB0m1OPtv6PeShYFcDrw7Ya9/EvdGtYWdrqk3zcQR1svjQZ2jvSvh02QWKTIky4D/xyKmE39XI7qeA4zciKNZkp11nDfV+Sw9arW+WU5/2WN3y+qmrlIA3LuvCL9IqHx+OP6z/FBmITwhY7ifFUmbTj2RR42j23t+zpuXyaheIpb4Mi+7EzoJXHU+4jfgR6ZPcn2QGuQHOLZpp8Ix+I5iTgGgDmNH00HlbUFtT4jn5z9PKBq/MVbTIYaxT2LzKB1NG3MUlvmlAkJHjFI7GYswTZEH5FmNPY2FBCDh9JnOhO4skedaIrJpA7i3/i6BdAOyOYQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbemzdUd7aU/79lqGl5ZH06FnBCAFQu5fC5B9CLE9t0PB2hFf8y/2PdL/ZHQ2eC9PxUg==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZIVmedGuaHRyfv3bcWGMMfmo71C1q0UXGvBzqp3EdTAAIdFreDUOiwiYlz6rrnO6HgtALhKjKxj/KgzGwFlDCL9+Not4eOkik+8xwj6LZVWLJa6POE9mP6tagOc7Du/vR5Aa8rOT9Pd60J+wi9OxWaGQE+8JsCJC+gCe1Y6dy3Fkvb/S0guq8Qmn+xi7TdI/6gzEYkmmj+qVfLU+Pw/A2MFNWIEO/1CqcD8Y2v2X6oaCeWH0MeewWJG3vDjCJE75ncRTydN/1Inpm8RB160YJ0Y3ZxowNHnHEqApoRMbvbGA==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krhl46OH701sAJ0MiCdr1ukkjdESRzdm0xjZXWPiQ/THRHPMAQKnReeHuPO/e4gxkJJfnAsj0yFZJbEqNY+wxJffmaVOhfHyDKNuUwg2J+TM3YSgFrXtee1FvPIYszpaVxg/obf63Xb+v257iOHkSZt+YBJsSlZ/UOAImz7jSHmPIMx4sB3mdC1JsgNN8N7/cnEWpPe2DX7ynaDOOtlZNAcXEV4smtZITlusBvs1Hd3HdMeUss/Rh/eLVFKRTgnDmoC4XOQMqiC0xInKFwf6ylHIasJisof4VQ7mTXDc+N69Jlg67JZvFIN+uuE7Hm2w/uZ1utf1U76fIBNBvD0IiW7PqZahg5zdpKuq8obNsoYMU+BgR+RK02vH2l9cjtpbdTfuI/Vj+qcZnxKVLYCwm/tZLbjKE/eQoDqJZPTUu0yUyAFKPDgkEIeUT8lrBsxBckqHcup3NPvQLK/37Hlaz6uX</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>