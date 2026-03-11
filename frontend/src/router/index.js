import { createRouter, createWebHistory } from 'vue-router'

const page = (name) => () => import(`../pages/${name}.vue`)

export default createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: page('DashboardPage') },
    { path: '/owners', component: page('OwnersPage') },
    { path: '/pets', component: page('PetsPage') },
    { path: '/appointments', component: page('AppointmentsPage') },
    { path: '/consultations', component: page('ConsultationsPage') },
    { path: '/pharmacy', component: page('PharmacyPage') },
    { path: '/admissions', component: page('AdmissionsPage') },
    { path: '/billing', component: page('BillingPage') },
    { path: '/reports', component: page('ReportsPage') },
    { path: '/settings', component: page('SettingsPage') }
  ]
})
