<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY Control.Unit.Access.Type "2">
  <!ENTITY Controller "VoucherBookTemplates">
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
]>

<grid table="vv20dmnkt" code="ma_nkt" order="ma_nkt" filter="&Control.Unit.Access.UnitFilter;" initialize="&Control.Unit.Access.UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">

  <title v="Khai báo mẫu quyển chứng từ" e="Voucher Book Template"></title>
  <subTitle v="Cập nhật khai báo mẫu quyển chứng từ: thêm, sửa, xóa..." e="Add, Edit, Delete Voucher Book Template..."></subTitle>

  <fields>
    <field name="tag" type="Boolean" width="60">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_nkt" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Mã quyển" e="Book Code"></header>
    </field>
    <field name="ten_nkt%l" width="300" allowSorting="true" allowFilter="true" readOnly="true">
      <header v="Tên quyển" e="Description"></header>
    </field>
    <field name="ntype%l" width="150" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Loại" e="Type"></header>
    </field>
    <field name="type" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="ma_nkt"/>
      <field name="ten_nkt%l"/>
      <field name="ntype%l"/>
      <field name="type"/>

    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758MDxOdugL5okNOa7/KzmZ3ee/JD7KSMnchVkkfOAnB3koFo3Hnmqn9MPdHFa0hldohySB/MasyS8AEnROajeNav3KPnYfwM3kRiMf5ZVeimsK2qKvnI/rvOlpz5wfe9CuVC/ucMvB9jnL5Z00UM0jE=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKvjuPmFP28V0XIguONEHyFyJOWllvpYyDdCUSx2YRNyC8db4t3WTJdZnIo76RRoqKG1wyPZL0yYGsFAFtB46AzTr3ImxJ1JjW6kfs8YPwV9sWfZ5KbkoyMkCzgSGMON6LHBgvHhKQImctR1g2AIWzqMnZmqAgBR2Q24F3fGxFgz</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHFe1/A+eqz1Gz0cpcG1pqE+6hAd8SgR1MnxTGwZmDPng+gDVt3QmDNBWKHbHuDfVA4usE6lBUN1vJiMOc9SlGeAIDgnr5kgzEn4jdPvC1nfLv7vVHo+26572ddxtkoNZD0w/gqYL8jmgKlU0yGrP9OVVBWn4L+0Fv4QO8fpfqJM</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFDBO0uGfLKRIl27ikCwvONG/t3LOYHLyuTQM54WHdsrCRrYzCQ8q78yVsdVSmuLXi921kbQO1+7nfkOTDZvEcsk=</Encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753W7sVkJn1qX8G5AYCGuxo27k7doDhOZ6XpLfnT0eqn9wQ+/VVs1oUSBRCadbvlPbYSzBcawku2T2vsU1Q3RHV8=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QsMhJE1WhHzxQMYzOCHGGsG8HAAYp9TCFPr+4cvAtgfYheH+Evvdray+q+2R4ouFuY4fZVdGTnZGfWmJ/lUpyhfuscFL4w3QTPDiKFO4MWJAmF0tKyMsC1lJ83arzF8HJcK1vjHUhmKjT11gcdaPyEDmLnwm3N+uBhKsxt38bKG</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHUCothhCKotCSIkskECrMjgXKNAuElAZjz4ecWTJ8dS9M8fDYRlH/tLaGZbF1Bd31nqFNn0mTppYvJIBEL3yQf4=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyEXiWUQ0H4vSWLEfZL3wtMAAy238Y8zYZbW2rHgA1/hDwbdDkPMzWLF8acH6IQu5nFXEZ/ykiUjKpcp1e7k8Odi5zKjLBQvWRSK9YIya5CRRFHAiPnTj6X53RvXFO15i8QxFqG/zF60311lvBVwuPlAs=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyERnOvM4NG/oV2IoQpuvFNmPT8aFeXkqML0n58IyfPpyVJPSeqAr9CDMdp2coTBVvqkkFAp+IAf1AoN1bjyVfATa04dMSYSXGKQDFIFb/o20G</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHXu8ejmCjlg4le7f8HVshRtBF4ioqKfyU4hfHFBUbM2nLvddig5/eUyfWZ5kjxhRxWmFnknDRDRkepQJZh/Izlk=</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&udt43HER0ZKtYSlUlqdyETI2WiGOq6VNUevZE9pq357DcNxnQ9HSc0BB2LwNdOowd5xhuCTqWPlyeJGmutd9k7dwE8Gc4P4qPGxTeRj4bucWks5/p/YhHWn6U3jbCNL3myDm3kBTGf0h4JMXWfZtpiHQ/WkEerP4ZD+711/RwjV37Y9kGI8wMo3RKsh/emTPLhh9D4LOBWLgehgXeuiMKM7O+WLA5z+qXJDrwWDibThk/zU6fWDy1yaQSKYBxw40uykZoilHZi5nwU45URLQqw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&DkaMwposE0M+JHLbKoA5yqKUfumFZ9Cud8HY3dK8vPQYsoxD3CBUNStdkXUJSOcbhwgxS/rcAkFHUcekaEM4AVTt4gpuBLzdGidA/hhECXXerPezCPiE4yvnyGnZH78j3I8LYTkjFjF4LgEiCCFJHEBv5A2Uo0enS4B2avuSsx172tkJlwyERqql6XMfqVfH3kLCCNzF0cqmUqrcIrdrFw==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&p+Mc5z7Aeenbd3crXYA0Llh4GRzbLk5subBuR94QQgi+6uC18/PfO0oc5os/7KdlGxkJM8Bbl1dTmsZMQTsBamRHoc+j2yOd0mMOfHMliUn74SZhpM+mwMw9LsESRD6oLzTik0PVaepjdMiBGrERQ1y+75fKtUSTzMHhXM8KiA/WgMtxhNr1BFGHJcUhjnAVKyA4ed3jeAutL+Ky/TZMSA==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&UHjE/bNu0vFed4bfbwMFToTqm21NKeqmW62s4/BiBh/O7RcH6hwo+gg2RtSlTsUkH/kwFtTi3VYq+wuG4/AA9AwyI/bhTlQL4+MOW0ip1VOBb6pYORpaG7Ymsmyw8aXsckksQEIvWFBC+p9UTRVFcdmbUjZVAKgOVAcKE3eSCG8GPqzaeWLomCfrHlRtA5IqFi+9N1Rz180MRN77FCl9AUhiI2FWotEMUeigjLb49ubOYVdYJbb95y5CrgXymc1tG34fV+I0ebVRsRt4jt4n+Q==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&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</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxDHq+z7ira0Y8YRiTKRPG3WIMmom9KJEmV8J9OviJBvv9fLGD0Bu++OUJegO8HiDEmeb+m4bQ8ktmXhISRqo5TKjTlu9t13YuqNb2jZCQphRhLNEEe0pvxlNwdTnxXxUsf1qZLR16sCk7dWzEBfx6JPnpTpa4YYSGOJZH2PuUJYCDYMBBMUs4AV6BgrOgX749jcYrOfjp3njg7yNFlT7JqGEYaP4YDeAaGEKi0OIcDR4Zgmb/GGVeYRPptkb0buNoEGW565/sf6xnutfmDupLMZfb8VZBbgvMFILoJMUbvioEXrPjgOqN6+czQh75sKnQ==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>
    <button command="VoucherBookTemplatesCreate">
      <title v="Tạo quyển chứng từ$$75" e="Voucher Book Generate$$75"></title>
    </button>
    <button command="VoucherBookTemplatesUpdateStatus">
      <title v="Cập nhật trạng thái quyển chứng từ$$75" e="Update Voucher Book Status$$75"></title>
    </button>
    <button command="VoucherBookTemplatesDelete">
      <title v="Xóa quyển chứng từ$$75" e="Delete Voucher Book$$75"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>

</grid>