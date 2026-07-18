<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
]>

<dir id="PC0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phân bổ" e="Allocation"></title>
  <fields>
    <field name="stt_rec" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" inactivate="true">
      <header v="Mã ncc" e="Supplier"></header>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi" inactivate="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="ma_nk" clientDefault="Default" inactivate="true">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_nk%l" key="status = '1' and ma_dvcs = @u and ((@d &gt;= ngay_hl_tu or ngay_hl_tu is null) and (@d &lt;= ngay_hl_den or ngay_hl_den is null)) and ma_nk in (select ma_nk from v20dmctnk where ma_ct = @@id and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0))"/>
      <handle reference="so_ct"/>
    </field>
    <field name="ten_nk%l" clientDefault="Default" readOnly="true" hidden="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Create Date"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfFkdHUJGZRzLddtfeDImmNsainqmNq8Clo9JQTCIfwpun28GRKa6EFya3mztFcY0w==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>

    <field name="ma_nt" filterSource="detail" aliasName="b" inactivate="true">
      <header v="Mã ngoại tệ" e="Currency"></header>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" aliasName="c" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 100, 230, 100, 0"/>
      <item value="11101: [ma_kh].Label, [ma_kh], [ten_kh%l], [stt_rec]"/>
      <item value="1100: [dia_chi].Label, [dia_chi]"/>
      <item value="1100: [dien_giai].Label, [dien_giai]"/>
      <item value="11--1: [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="11: [ngay_lct].Label, [ngay_lct]"/>
      <item value="11: [ngay_ct].Label, [ngay_ct]"/>
      <item value="11101: [ma_nt].Label, [ma_nt], [ten_nt%l], [ma_dvcs]"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7VSmatPquk/uFPfDPa5HqIf9nZ1d3I7iop/eo6IvhacpmhRZtm74jx6kGRkkdXf3zKrmu3dqD7ebFnRCN0d49Q=</encrypted>]]>
      </text>
    </command>

    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5mXybsIvOX8+lnQmlfesIjw3efb0NmpM2a7k94PjieBbsxDsOmxVgOOQkfdTTO19fESqSoW0B41vRdm0vhrAkuR3wKhqzCc+ebCYlWXvwEO</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1BKdk23Bd2xZZLXh5DiUqpjPVf6hxNNba1mrYBDNkE5f6kYiPNhigBxOSdqsAk1xV8ayN8V7ZL8L6p4//eQ0UCwSFeA7fQRlbqQ59nj4v/AyVe4Ijv0JGgp5ojAp8+B04AyyfzzARFgrBlTjth1rWaKP8Ic08OX1AwZedcapMqe</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYIOW0va7K8ykdWiLPjhxhG0UPpwRsnLerR1fNsKWPk03tXgSi0EHzVmgB+Oz8F+pUo=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70JXM4VdDAZVZ5ZqvThRkUC3cTG59kFXUZQMCjTJ4rGj6ZX9qZ8zBCXtTQ6odxHjHVr8hqtHcTjuCupJjISw8EHD/9HLHRxgIUr8Ac9FOuTNTO7L+VDmBt2lSgBV+bTsfHp5GE6rF5jqkhdMrrov0+COjIoJlIL/hwZvfoUDG1X41v1J1oyxg1nVFM3kq5yfJMIfu9YsY0uDBOx4CUDHs2NIBOVyEi9M2Gp+nKXhFOMhGZH06DwNpqWqNdpfzkKNSWxkK/gwq1tzn1s6ccP2+4xMgSW8cORoBflj09SOCjSPBlIw6K76Y2Wp5ItCwpd8o2CbViiE8E2zSgxmhNVKl4bD0KMXTupJ2BBVckeOOIGQulRnPEbRqimwK8Vzh0AjU1g740Mz4gJHchzfkdM8b6nPINwAgUARbVGbEyoZX8Vi/</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TrLX0MZxry0Iuf8rWWhsdxV5Ldg48fbXQcm14yQatVAwofF8a5m/7k8duF3d3TRZCOKl9n9MAjZP2ufTMTYDNMQsqqZWg1pNmhSFbmdWyDs/anQqKVhKrdfNHSFmNuu0aGwlpptKtPvOrXfAyvbS1IBQ7tZvZ5PjcGpy+brXK1CiJXvelZYgfefu116NcpNfxqPqMTFlMZ6KT/oAnGwScUUJuNF0BGFb8Jys5nnZ0YzRr8CCAbdid7DapXL/rNqGyCgfnug0B/liZ7s4NXqlE+PGwcVqo5GXvAhqQEW/tndJraEmbDl0cZyMp/kadFRwXS6obQyVAtNocxP1vpdFzmnP4XXSBgrDhLuIgWm3+gyk2bfuFA6u86PMxnjDuVEhktF63bRLjfp5zkpSi9YBv8Y387mwOcxIzvH74Spc/WsofVWHdLmESS/Quz+JauyftoADA4pLGchkAfeB4/w/3wAA6aihV/6cHNEk7oajWGA7YKPyIgUmdSHhYV6bf2fjd1EpKcSVf8/xieck71UDaB27uxJs+aPlPz7rO4KhBHhwGkkQUxq1A55TE9nvCJzWLB405a47bTQ8lB3XwtuiPv0sxyP3O/oYgCbUXbRCDt0DEUhLL9x2R+r16dmSDvM8BvOX0wJLNAeSpnf3oshcn/itlvWYHFM/t6sfIbLD2BiXNK34knDkoIpfPYpczzckSBRHCQ9kQcr79IzmtvSKup3uk1NcBSI9i1eJ9RgFilkg19PjThXqMwvzBZREhqvLTYgFEAvgttIHv+4g/EJCSGonYdoFPBbOfuMxMGG3la3dPwa7Bb7U8M3ydH0cad1c8vP7xBXgdqvXIOPwAPgcTBf+lpybA730mAhh8jNjTS3SsO/ZgJtC2d6EGRBN/Ll/rHREcOgauyBmX6FUjb0Nh+CDiPZGjdQKA3kqoBtNQc40DSmbPZkce5ddQq1mLddH4hg+5eQFk620pVBu68/0OWupHcxjjoBxhwX8t7EaU8z3uPN14IAKTDFDxzt10X742/QnF7/PAO+KC3KFJQc9/SEbCRC0qfXYhYrrDyiu5zOB3RXmWca/taSRo37aJnpxcreOX9iAeHVJWW7kEoiIXjFG7eZtexp7dm2Yr+4zUxB10Am+lEPl3OeCY7NVCUpK91NKPgq7LF7pRiMGIdAZnpkcDxmEMyEDD8BnGLPkWPHOn/sdEX7l3pJmvMdALYvZvO7ezawzLlHnbf9FeoKOjOu1jeP7p75HDn9mrDzTcm+7xSHIguFWUoiNoY9kGuPyp/uCmpQpK7+Rkd1CCESHrjulEAPRse66fKTie8qFMrTZ3GV1iMlahJGaLPPpuySZjql8nah1SmmBvuAApCpGQqnAiTdzWMGB4HRuKiyYnL+YHHuxUheQVDr/hgo5z2RSsHD+zhKp2x+qajhkBrhCFXyMCpOTuQsL/yfeaoFMo3q</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherNumber;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70F+SXr2tyLGktNDy7D5snBfUPWEbzgiQZwQLTSJusBnLHQMpB8hWxd2ZKmyKJDR4Cmf4jigZnbvj0PQlTPLWTCvWvxdN4CIwvXwoBfPhP53zkcb6XcFdil21VE1NNj24SQ6RS+ryBKEr9E70mdIvfFKCOS3doNRO+DPXRCDs6limwNYAcBVlve0Pn1lOD9YnjJkWbeKg1ZBVsRbxFwYQ4v5WMCTBeqWTksjykn8rOKsJixgNXrKdVqh8dZ5OJuOW4pK4CmNfcex8O9wV6VCktrGiTGDwSrqYlZ8PiTuMz+aHLIyUwHF1tBDqaq5Wj3JkcM1SdNJ2ZAFx0tooXGiisXgDV23AnfyNTgh7L0Y3nDuUudV9IDR8cGCxfNr3/+whBLexv/+n3nkcHcJAkMgMzdX66Zv7aPAMFII9GCpIsrP2VQGmTr+p6byy/qkp7zXjxkvGftbqY6qtfnTQnpXoGrOoye7Lc7hr2Tf+2Sm19q8eE8jzSqES2NsTtR/CV/AV9tUAH4uj+HZVSl6B5CW0AZE=</encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KqMRMdZsHblxKrQpj3xLdHT+JHf6TfQAVoUop3mWLlAG</encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KrDfMUundP1XoVaZXm930VkTd/c/il68I1/h3ZPu17ous4re/zW2TSn0jPk90ChvECsBrj+tEFroZGAA7ZkUEfjELt1vYV8+KXKxWZXmJBItW9n9UtWHIXlaTgkBXECm+nRyoOUYbf6S7W7smdS9ANIi58fKqkuKUOriN4PKl3xCBGlYnKeZD9dpEzDJGB/rfMgZohTQ0LFUI4BjG6F6zHPABiSj/2U8kIm6W8Gbi9QEej1MbZp38OgSVyMVDzw8q3voURwIT44KlxSnYLJy7ul/cFyFe9j3UKg9zsayb2M4eGoFRi4DpJEYiD7u0LqEw5oAAYaj2EjXN6SR/2VSykKs9Wm95LHcIa36dQk/5i4X3iwUTH2fy0TirBQ4ZveUqfcHUXIN0SJVTOsCdolB85o=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;
  </response>

</dir>